class Answer < ActiveRecord::Base
  attr_accessible :response_text, :question

  belongs_to :question
  belongs_to :response
  belongs_to :questionnaire
end
