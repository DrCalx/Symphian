class AddBioToGroups < ActiveRecord::Migration
  def change
    add_column :groups, :bio, :string
  end
end
