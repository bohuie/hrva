class ChangeDescriptionTextLimit < ActiveRecord::Migration
  def change
    change_column :sections, :description, :text, :limit => 16777215
  end
end
