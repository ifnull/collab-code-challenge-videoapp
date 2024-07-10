class CreateVideos < ActiveRecord::Migration[6.1]
  def change
    create_table :videos do |t|
      t.string :title
      t.string :video_id
      t.integer :views
      t.text :description
      t.string :thumbnail_url

      t.timestamps
    end
  end
end
