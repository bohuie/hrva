class Answer < ActiveRecord::Base
  attr_accessible :question_id, :response_id, :response_text

  belongs_to :question, :response

end
