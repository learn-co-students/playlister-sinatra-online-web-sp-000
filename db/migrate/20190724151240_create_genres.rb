class CreateGenres < ActiveRecord::Migration[5.2]
  def change
    create_table :genres do |t|
<<<<<<< HEAD
      t.string :name
    end
=======
      t.string :name 
    end 
>>>>>>> 9124cd55a1b9034daf5e4982762b9ec4ee70aca8
  end
end
