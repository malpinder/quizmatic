class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.belongs_to :quiz, index: true, null: false
      t.integer :position, index: true
      t.text :body
      t.integer :available_marks

      t.timestamps
    end
  end
end
