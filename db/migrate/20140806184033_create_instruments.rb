class CreateInstruments < ActiveRecord::Migration
  def change
    create_table :instruments do |t|
      t.string :name
      t.string :category

      t.timestamps
    end
  end
end
