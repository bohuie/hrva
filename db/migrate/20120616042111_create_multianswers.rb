class CreateMultianswers < ActiveRecord::Migration
  def change
    create_table :multianswers do |t|
      t.integer :response_id
      t.integer :answer_id
      t.boolean :selected

      t.timestamps
    end

    add_index  :multianswers, :response_id
    add_index  :multianswers, :answer_id
    add_index  :multianswers, :selected
  end
end
