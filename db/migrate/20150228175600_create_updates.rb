class CreateUpdates < ActiveRecord::Migration
  def change
    create_table :updates do |t|
      t.references :group, index: true
      t.string :body

      t.timestamps null: false
    end
  end
end
