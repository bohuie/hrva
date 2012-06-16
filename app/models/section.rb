class Section < ActiveRecord::Base
  attr_accessible :description, :title, :order_id

  has_many :questions

  validates_presence_of :title, :order_id

  def self.tab( num )
    if num == 1
      Section.all.select{|s| s.title == 'Area Profile'}.first
    elsif num == 2
      Section.all.select{|s| s.title == 'Natural Hazards'}.first
    elsif num == 3
      Section.all.select{|s| s.title == 'Preparedness'}.first
    elsif num == 4
      Section.all.select{|s| s.title == 'Accidental and Human Caused Hazards'}.first
    else 
      Section.all.select{|s| s.title == 'Compounded Risks and Hazards'}.first
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
