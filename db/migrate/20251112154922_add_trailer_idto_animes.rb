class AddTrailerIdtoAnimes < ActiveRecord::Migration[8.0]
  def change
        add_column :animes, :youtube_id, :string
  end
end
