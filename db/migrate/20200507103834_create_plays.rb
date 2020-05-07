class CreatePlays < ActiveRecord::Migration[6.0]
  def change
    create_table :plays do |t|
      t.string :image_url
      t.integer :counter

      t.timestamps
    end
  end
end
