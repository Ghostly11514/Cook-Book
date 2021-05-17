class CreateRecipes < ActiveRecord::Migration[6.1]
  def change
    create_table :recipes do |t|
      t.string :name
      t.string :p_time
      t.string :c_time
      t.text :steps
      t.text :ingredients

      t.timestamps
    end
  end
end
