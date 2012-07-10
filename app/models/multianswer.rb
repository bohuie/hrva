class Multianswer < ActiveRecord::Base
  attr_accessible :answer_id, :response_id, :selected, :response, :value, :rank
  
  belongs_to  :response
  belongs_to  :answer

  validates_presence_of :response_id
  validates_presence_of :answer_id, :unless => 'new_record?'

  def self.top5
    ['1'.to_sym, '2'.to_sym, '3'.to_sym, '4'.to_sym, '5'.to_sym]
  end

  def self.top3
    ['1'.to_sym, '2'.to_sym, '3'.to_sym]
  end
end
