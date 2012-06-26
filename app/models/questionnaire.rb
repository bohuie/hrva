class Questionnaire < ActiveRecord::Base
  attr_accessible :user_id

  belongs_to :user
  has_many   :answers

  def next
    @a = self.answers.last
    if @a
      # continuing the survey 
      # xxx - supplement this s.t. it filters out questions with parent questions that have wrong response value
      return Question.where( "order_id > ?", @a.question.order_id ).order("order_id asc").first, @a
    else
      # starting the survey for the first time
      return Question.first, nil
    end
  end

# def prev( ans )
#   answers.where( "id < ?", ans.id ).order("id asc").last
# end

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
    if question.qtype == 'rank_five' || question.qtype == 'rank_three'
      question.responses.each do |r|
        ans.multianswers.build :response=>r, :selected=>'false', :value=>'0'
      end
    end
    return ans
  end
end
