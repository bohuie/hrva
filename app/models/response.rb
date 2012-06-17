class Response < ActiveRecord::Base
  attr_accessible :label, :value, :definition

  belongs_to :question

  validates_presence_of :value
end
