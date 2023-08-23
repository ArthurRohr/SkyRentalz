class RemoveTypeFromJets < ActiveRecord::Migration[7.0]
  def change
    remove_column :jets, :type, :string
  end
end
