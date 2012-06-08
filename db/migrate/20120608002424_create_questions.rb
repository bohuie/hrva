class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.text :item
      t.string :type
      t.text :instruction

      t.timestamps
    end
  end
end
