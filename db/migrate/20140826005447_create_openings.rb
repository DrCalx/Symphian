class CreateOpenings < ActiveRecord::Migration
  def change
    create_table :openings do |t|
      t.integer :group_id
      t.integer :instrument_id
      t.string :zip
      t.text :description

      t.timestamps
    end
  end
end
