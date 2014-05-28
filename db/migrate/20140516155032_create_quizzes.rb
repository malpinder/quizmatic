class CreateQuizzes < ActiveRecord::Migration
  def change
    create_table :quizzes do |t|
      t.belongs_to :user, index: true, null: false
      t.string :title, null: false
      t.text :instructions
      t.boolean :published, default: false

      t.timestamps
    end
  end
end
