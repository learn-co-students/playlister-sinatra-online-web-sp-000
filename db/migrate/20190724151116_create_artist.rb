class CreateArtist < ActiveRecord::Migration[5.2]
  def change
    create_table :Artists do |t|
<<<<<<< HEAD
      t.string :name
=======
      t.string :name 
>>>>>>> 9124cd55a1b9034daf5e4982762b9ec4ee70aca8
    end
  end
end
