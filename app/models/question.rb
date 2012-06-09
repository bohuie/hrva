class Question < ActiveRecord::Base
  attr_accessible :instruction, :item, :qtype

  belongs_to :section

  validates_presence_of :item, :qtype
end
