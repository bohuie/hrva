class Questionnaire < ActiveRecord::Base
  attr_accessible :user_id

  belongs_to :user
  has_many   :answers

  def next
    @a = self.answers.last
    if @a
      # continuing the survey 
      return Question.where( "id > ?", @a.question_id ).order("id asc").first, @a
    else
      # starting the survey for the first time
      return Question.first, nil
    end
  end

  def prev( ans )
    answers.where( "id < ?", ans.id ).order("id asc").last
  end

  def complete?
    self.answers.count == Question.count
  end

  def build_answer( question )
    ans = self.answers.build :question=>question
    if question.qtype == 'many_responses'
      question.responses.each do |r|
        ans.multianswers.build :response=>r, :selected=>'false'
      end
    end
    return ans
  end
end
