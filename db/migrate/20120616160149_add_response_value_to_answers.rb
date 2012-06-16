class AddResponseValueToAnswers < ActiveRecord::Migration
  def change
    add_column :answers, :response_value, :integer
    add_index  :answers, :response_value
  end
end
