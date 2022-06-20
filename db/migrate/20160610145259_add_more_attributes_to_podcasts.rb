class AddMoreAttributesToPodcasts < ActiveRecord::Migration[5.1]
  def change
    add_column :podcasts, :overcast_url, :string
    add_column :podcasts, :android_url, :string
    add_column :podcasts, :pattern_image, :string
  end
end
