class CreateImgposts < ActiveRecord::Migration[5.2]
  def change
    create_table :imgposts do |t|
      t.string :name, null: false
      t.string :img, null: false

      t.timestamps
    end
  end
end
