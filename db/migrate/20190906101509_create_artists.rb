class CreateArtists < ActiveRecord::Migration[5.2]
  def change
    create_table :artists do |t|
      t.string :name
      t.string :slug_name
      t.timestamps null: false
    end
  end
end
