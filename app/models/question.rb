class Question < ActiveRecord::Base
  attr_accessible :instruction, :item, :qtype

  belongs_to :section

  validates_presence_of :item, :qtype

  def self.qtypes
    ['one_response'.to_sym, 'many_responses'.to_sym, 'text_response'.to_sym]
  end
end
