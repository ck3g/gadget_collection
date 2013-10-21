class CreatePictures < ActiveRecord::Migration
  def change
    create_table :pictures do |t|
      t.references :gadget, index: true
      t.string :title
      t.string :image

      t.timestamps
    end
    add_index :pictures, :title
  end
end
