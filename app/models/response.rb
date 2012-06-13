class Response < ActiveRecord::Base
  attr_accessible :label

  belongs_to :question

  validates_presence_of :label
end
