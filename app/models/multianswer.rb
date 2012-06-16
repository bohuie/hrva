class Multianswer < ActiveRecord::Base
  attr_accessible :answer_id, :response_id, :selected, :response
  
  belongs_to  :response
  belongs_to  :answer

  validates_presence_of :response_id
  validates_presence_of :answer_id, :unless => 'new_record?'
end
