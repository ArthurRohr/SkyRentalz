class CreateJets < ActiveRecord::Migration[7.0]
  def change
    create_table :jets do |t|
      t.string :name
      t.string :model
      t.string :type
      t.integer :capacity
      t.float :price
      t.string :location
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
