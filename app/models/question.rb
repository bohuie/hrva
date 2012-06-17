class Question < ActiveRecord::Base
  attr_accessible :instruction, :item, :qtype, :order_id

  belongs_to :section
  has_many   :responses, :order=>'value asc'
  has_many   :answers

  validates_presence_of :item, :qtype, :order_id

  def self.qtypes
    ['likert_scale'.to_sym, 'one_response'.to_sym, 'many_responses'.to_sym, 'rank_five'.to_sym, 'rank_three'.to_sym, 'text_response'.to_sym]
  end
end
