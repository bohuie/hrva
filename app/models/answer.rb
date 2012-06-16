class Answer < ActiveRecord::Base
  attr_accessible :response_text, :question, :question_id, :response_id, :multianswers_attributes

  belongs_to :question
  belongs_to :response
  belongs_to :questionnaire
  has_many   :multianswers

  validates_presence_of :questionnaire_id, :question_id
  validate :answer_present
  validates_uniqueness_of :question_id, :scope=>:questionnaire_id

  accepts_nested_attributes_for :multianswers

  def prev
    return self.questionnaire.answers.last unless self.id
    return self.questionnaire.answers.where( "id < ?", self.id ).order("id asc").last
  end

  def next
    return self.questionnaire.answers.where( "id > ?", self.id ).order("id asc").first
  end

  def build_multianswers_if_none
    if self.question.qtype == 'many_responses' && self.multianswers.empty?
      self.question.responses.each do |r|
        self.multianswers.build :response=>r, :selected=>'false'
      end
    end
  end

private
  def answer_present
    if self.question.qtype == 'one_response' && self.response_id.nil?
      errors.add(:base, 'Please fill in an answer before leaving this page.' )
      return false
    end
  end

end
