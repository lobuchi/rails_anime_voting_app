class CreateScorings < ActiveRecord::Migration[8.0]
  def change
    create_table :scorings do |t|
      t.references :user, null: false, foreign_key: true
      t.references :anime, null: false, foreign_key: true
      t.integer :score

      t.timestamps
    end
  end
end
