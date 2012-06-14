class Answer < ActiveRecord::Base
  attr_accessible :response_text, :question, :question_id, :response_id

  belongs_to :question
  belongs_to :response
  belongs_to :questionnaire

  validates_presence_of :questionnaire_id, :question_id
  validate :answer_present

  def prev
    return self.questionnaire.answers.last unless self.id
    return self.questionnaire.answers.where( "id < ?", self.id ).order("id asc").last
  end

  def next
    return self.questionnaire.answers.where( "id > ?", self.id ).order("id asc").first
  end

private
  def answer_present
    if self.question.qtype == 'one_response' && self.response_id.nil?
      errors.add(:base, 'Please fill in an answer before clicking Next.' )
      return false
    end
  end

end
