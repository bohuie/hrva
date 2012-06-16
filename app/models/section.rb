class Section < ActiveRecord::Base
  attr_accessible :description, :title, :order_id

  has_many :questions

  validates_presence_of :title, :order_id

  def self.tab( num )
    if num >= 1 && num <= 5
      Section.all.select{|s| s.order_id == num}.first
    else 
      nil
    end
  end
  
  def prev_complete?( num, q )
    pnum = num - 1;
    if pnum > 0
      psec = Section.tab( pnum )

      # check if num questions in psec is same as num answers in psec
      num_questions = psec.questions.count
      num_answers   = q.answers.select{|a| a.question.section == psec}.count
      return num_questions == num_answers

    else
      # first sec has no prev sec
      # so it's same as if prev sec is completed for access purposes
      return true 
    end
  end
end
