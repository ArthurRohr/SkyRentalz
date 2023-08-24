class AddCoordinatesToJets < ActiveRecord::Migration[7.0]
  def change
    add_column :jets, :latitude, :float
    add_column :jets, :longitude, :float
  end
end
