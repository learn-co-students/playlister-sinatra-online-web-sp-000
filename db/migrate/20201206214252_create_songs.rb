class CreateSongs < ActiveRecord::Migration[5.2]
  def change
    create_table :songs do |s|
      s.string :name
      s.integer :atrist_id
    end
  end
end
