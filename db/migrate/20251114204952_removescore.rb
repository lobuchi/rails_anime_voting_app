class Removescore < ActiveRecord::Migration[8.0]
  def change
    remove_column :scorings, :score, :integer
  end
end
