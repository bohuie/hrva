class Section < ActiveRecord::Base
  attr_accessible :description, :title

  has_many :questions

  validates_presence_of :title
end
