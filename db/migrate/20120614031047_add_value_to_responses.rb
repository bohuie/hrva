class AddValueToResponses < ActiveRecord::Migration
  def change
    add_column :responses, :value, :integer
    add_index  :responses, :value
  end
end
