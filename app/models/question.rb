class Question < ActiveRecord::Base
  attr_accessible :instruction, :item, :qtype, :order_id, :parent_question_id, :parent_response_value

  belongs_to :section
  has_many   :responses, :order=>'value asc'
  has_many   :answers

  validates_presence_of :item, :qtype, :order_id
  validate   :parents_matches
  validate   :parents_values 

  def self.qtypes
    ['likert_scale'.to_sym, 'one_response'.to_sym, 'many_responses'.to_sym, 'rank_five'.to_sym, 'rank_three'.to_sym, 'text_response'.to_sym]
  end

private
  # ensure parent_question_id and parent_response_value are either
  # both present or both missing
  def parents_matches
    if self.parent_question_id.present? && self.parent_response_value.present?
      return true
    elsif !self.parent_question_id.present? && !self.parent_response_value.present?
      return true
    else
      errors.add(:parent_question_id, 'Please ensure parent question ID and parent response value are both present or both absent.' )
      errors.add(:parent_response_value, 'Please ensure parent question ID and parent response value are both present or both absent.' )
      return false
    end
  end

  # ensure both parent_question_id and parent_response_value exist 
  def parents_values 
    if parent_question_id.present? 
      q = Question.find_by_id( parent_question_id )
      # make sure parent_question_id exists 
      if q.nil?
        errors.add(:parent_question_id, 'must exist.' )
        return false
      else
        if parent_response_value.present? && !q.responses.find_by_value( parent_response_value ).nil?
          return true 
        else
          errors.add(:parent_response_value, 'must be valid for parent question.' )
          return false
        end
      end
    else
      # no parent_question_id, so no checks needed
      return true 
    end
  end
end
