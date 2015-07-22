class RemoveColumnAgeFromProfiles < ActiveRecord::Migration
  def change
    remove_column :profiles, :age, :integer
  end
end
