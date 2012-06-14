class Questionnaire < ActiveRecord::Base
  attr_accessible :user_id

  belongs_to :user
  has_many   :answers

  def next
    @area_questions = Question.all.select{|q| q.section_id == 1}
    @area_questions.third
  end
end
