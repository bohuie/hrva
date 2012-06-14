class Answer < ActiveRecord::Base
  attr_accessible :response_text, :question, :question_id

  belongs_to :question
  belongs_to :response
  belongs_to :questionnaire

  validates_presence_of :questionnaire_id, :question_id
  validate :answer_present

private
  def answer_present
    errors.add(:base, 'test' )
    return false
  end

end
