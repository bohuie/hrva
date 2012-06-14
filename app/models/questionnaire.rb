class Questionnaire < ActiveRecord::Base
  attr_accessible :user_id

  belongs_to :user
  has_many   :answers

  def next
    @a = self.answers.last
    if @a
      return Question.where( "id > ?", @a.question_id ).order("id asc").first, @a
    else
      return Question.first, nil
    end
  end

  def prev( ans )
    answers.where( "id < ?", ans.id ).order("id asc").last
  end
end
