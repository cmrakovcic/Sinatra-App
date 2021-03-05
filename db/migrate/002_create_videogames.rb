class CreateVideogames < ActiveRecord::Migration[6.0]
  def change
    create_table :videogames do |t|
      t.string :title
      t.string :date_purchased
    end
  end
end
