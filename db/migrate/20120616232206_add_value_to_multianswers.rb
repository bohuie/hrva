class AddValueToMultianswers < ActiveRecord::Migration
  def change
    add_column :multianswers, :value, :integer
    add_index  :multianswers, :value
  end
end
