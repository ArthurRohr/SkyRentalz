class AddjetTypeToJets < ActiveRecord::Migration[7.0]
  def change
    add_column :jets, :jetType, :string
  end
end
