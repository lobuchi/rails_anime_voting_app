class CreateTrailers < ActiveRecord::Migration[8.0]
  def change
    create_table :trailers do |t|
      t.string :youtube_id

      t.timestamps
    end
  end
end
