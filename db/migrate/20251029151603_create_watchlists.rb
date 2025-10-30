class CreateWatchlists < ActiveRecord::Migration[8.0]
  def change
    create_table :watchlists do |t|
      t.references :user, null: false, foreign_key: true
      t.references :anime, null: false, foreign_key: true
      t.integer :status

      t.timestamps
    end
  end
end
