class Questionnaire < ActiveRecord::Base
  attr_accessible :user_id

  belongs_to :user
  has_many   :answers

  def next
    #@area_questions = Question.all.select{|q| q.section_id == 13}
    #@area_questions.third
    @q = Question.all.select{|q| q.item == 'What is the approximate average age of the population in your area?'}
    @q.first
  end
end
