class Questionnaire < ActiveRecord::Base
  attr_accessible :user_id

  belongs_to :user
  has_many   :answers

  def next
    # @a = self.answers.last
    # if @a
    # continuing the survey 
    question_set = Question.order("order_id asc").all 
    question_set.reject!{ |q| self.filter_question?(q) }
    # return question_set.first, @a
    prev_ans = nil
    question_set.each do |q|
      ans = self.answers.find_answer_for_question( q ).first
      if ans.nil?
        return  q, prev_ans 
      end
      prev_ans = ans
    end

    # else
    # starting the survey for the first time
    return Question.order("order_id asc").first, nil
    # end
  end

# def prev( ans )
#   answers.where( "id < ?", ans.id ).order("id asc").last
# end

  def complete?
#   self.answers.count == Question.count
    question_set = Question.order("order_id asc").all 
    question_set.reject!{ |q| self.filter_question?(q) }

    question_set.each do |q|
      ans = self.answers.find_answer_for_question( q ).first
      if ans.nil?
        return false
      end
    end

    return true
  end

  def build_answer( question )
    ans = self.answers.build :question=>question
    if question.qtype == 'many_responses'
      question.responses.each do |r|
        ans.multianswers.build :response=>r, :selected=>'false', :value=>r.value
      end
    end
    if question.qtype == 'rank_five' || question.qtype == 'rank_three'
      question.responses.each do |r|
        ans.multianswers.build :response=>r, :selected=>'false', :value=>r.value
      end
    end
    return ans
  end

  # filters questions that don't need to be displayed/answered because 
  # parent question had specific values
  def filter_question?( q )
    return false if q.parent_question_id.blank?
    # if there is parent_question_id, check response value in its answer
    parent_question = Question.find( q.parent_question_id )
    parent_answer   = self.answers.find_answer_for_question( parent_question ).first
    # if question has no answer yet
    return false if parent_answer.empty?

    if parent_answer.get_responses_array.include?( q.parent_response_value )
      return false   # don't filter
    else
      return true    # filter
    end
  end
end
