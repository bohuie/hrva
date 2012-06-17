class AddOrderIdToQuestions < ActiveRecord::Migration
  def change
    add_column :questions, :order_id, :integer
    add_index  :questions, :order_id
  end
end
