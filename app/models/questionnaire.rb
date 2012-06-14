class Questionnaire < ActiveRecord::Base
  attr_accessible :user_id

  belongs_to :user
  has_many   :answers

  def next
    @area_questions = Question.find(:all).select{|q| q.section_id == 13}
    @area_questions.third
  end
end