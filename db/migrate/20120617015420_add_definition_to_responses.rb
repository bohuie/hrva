class AddDefinitionToResponses < ActiveRecord::Migration
  def change
    add_column :responses, :definition, :text
  end
end
