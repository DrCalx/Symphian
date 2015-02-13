class AddManagerToMemberships < ActiveRecord::Migration
  def change
    add_column :memberships, :manager, :boolean
  end
end
