class Answer < ActiveRecord::Base
  attr_accessible :response_text, :question, :question_id, :response_id, :multianswers_attributes

  belongs_to :question
  belongs_to :response
  belongs_to :questionnaire
  has_many   :multianswers, :include => :response, :order => 'responses.value asc', :dependent => :destroy

  validates_presence_of :questionnaire_id, :question_id
  validate :answer_present
  validates_uniqueness_of :question_id, :scope=>:questionnaire_id

  accepts_nested_attributes_for :multianswers

  before_save :set_response_value
  after_save  :remove_old_answers

  scope :find_answer_for_question, lambda{|pq| {:conditions => {:question_id => pq}}}

  def prev
    return self.questionnaire.answers.last unless self.id
    return self.questionnaire.answers.where( "id < ?", self.id ).order("id asc").last
  end

  def next
    question_set = Question.where( "order_id > ?", self.question.order_id ).order("order_id asc").all 
    question_set.reject!{ |q| self.questionnaire.filter_question?(q) }
    question = question_set.first
    return self.questionnaire.answers.find_answer_for_question( question ).first
  end

  def build_multianswers_if_none
    if self.question.qtype == 'many_responses' && self.multianswers.empty?
      self.question.responses.each do |r|
        self.multianswers.build :response=>r, :selected=>'false', :value=>r.value
      end
    end
  end

  def get_responses_array
    ([self.response_value] + self.multianswers.map {|ma| ma.value}).compact
  end

private
  # ensure one_response and likert_scale have an answer 
  # answers for other qtypes (e.g., many_responses, text) are optional
  def answer_present
    if self.question.qtype == 'one_response' && self.response_id.nil?
      errors.add(:base, 'Please fill in an answer before leaving this page.' )
      return false
    elsif self.question.qtype == 'likert_scale' && self.response_id.nil?
      errors.add(:base, 'Please fill in an answer before leaving this page.' )
      return false

    elsif self.question.qtype == 'rank_three' 
      responses = self.multianswers.map( &:rank ).compact
      if responses.length == 3 
        array_wanted = [1, 2, 3]
        if array_wanted == responses.sort
          return true
        else 
          errors.add(:base, 'Please ensure all items are unique.' )
          return false
        end 
      else 
        errors.add(:base, 'Please ensure 3 items are ranked.' )
        return false
      end

    elsif self.question.qtype == 'rank_five' 
      responses = self.multianswers.map( &:rank ).compact
      if responses.length == 5 
        array_wanted = [1, 2, 3, 4, 5]
        if array_wanted == responses.sort
          return true
        else 
          errors.add(:base, 'Please ensure all items are unique.' )
          return false
        end 
      else 
        errors.add(:base, 'Please ensure 5 items are ranked.' )
        return false
      end
    end
  end

  def set_response_value
    self.response_value = self.response.try( :value )
  end

  def remove_old_answers
    self.question.child_questions.select{|q| self.questionnaire.filter_question?(q)}.each do |q| 
      ans = self.questionnaire.answers.find_answer_for_question( q )
      ans.first.try( :destroy )
    end
  end
end
