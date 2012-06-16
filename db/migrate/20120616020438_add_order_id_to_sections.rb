class AddOrderIdToSections < ActiveRecord::Migration
  def change
    add_column :sections, :order_id, :integer
    add_index  :sections, :order_id
  end
end
