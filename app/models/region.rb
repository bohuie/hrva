class Region < ActiveRecord::Base
  attr_accessible :label

  validates_presence_of   :label 
  validates_uniqueness_of :label

  has_many :users
end
