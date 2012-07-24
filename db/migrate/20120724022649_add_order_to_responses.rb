class AddOrderToResponses < ActiveRecord::Migration
  def change
    add_column :responses, :order_id, :integer
    add_index  :responses, :order_id 
    ActiveRecord::Base.connection.execute "UPDATE responses SET order_id = value"
  end
end
