class AddRankToMultianswers < ActiveRecord::Migration
  def change
    add_column :multianswers, :rank, :integer
  end
end
