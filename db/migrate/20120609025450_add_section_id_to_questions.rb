class AddSectionIdToQuestions < ActiveRecord::Migration
  def change
    add_column :questions, :section_id, :integer
    add_index  :questions, :section_id
  end
end
