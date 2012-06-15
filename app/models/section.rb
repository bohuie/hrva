class Section < ActiveRecord::Base
  attr_accessible :description, :title

  has_many :questions

  validates_presence_of :title

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
end
