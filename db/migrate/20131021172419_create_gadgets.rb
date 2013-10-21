class CreateGadgets < ActiveRecord::Migration
  def change
    create_table :gadgets do |t|
      t.references :user, index: true
      t.string :name, null: false
      t.string :image

      t.timestamps
    end

    add_index :gadgets, :name
  end
end
