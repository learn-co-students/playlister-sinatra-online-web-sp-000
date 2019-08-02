class CreateArtists < ActiveRecord::Migration[5.2]
  create_table :artists do |t|
    t.string :name
  end
end
