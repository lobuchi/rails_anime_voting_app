class AddStatusToScorings < ActiveRecord::Migration[8.0]
  def change
    add_column :scorings, :status, :integer
  end
end
