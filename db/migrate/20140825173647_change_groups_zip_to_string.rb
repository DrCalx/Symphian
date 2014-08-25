class ChangeGroupsZipToString < ActiveRecord::Migration
  def change
  	change_column :groups, :zip, :string
  end
end
