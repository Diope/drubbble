class AddLocationAndForhireToProfiles < ActiveRecord::Migration
  def change
    add_column :profiles, :location, :string
    add_column :profiles, :available, :boolean, default:false
  end
end
