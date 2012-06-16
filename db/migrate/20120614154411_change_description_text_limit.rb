class ChangeDescriptionTextLimit < ActiveRecord::Migration
  def change
    change_column :sections, :description, :text
  end
end
