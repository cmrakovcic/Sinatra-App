class CreateVideogames < ActiveRecord::Migration[6.0]
  def change
    create_table :videogames do |t|
      t.string :title
      t.string :date_purchased
      t.integer :user_id
    end
  end
end
