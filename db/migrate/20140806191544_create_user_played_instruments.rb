class CreateUserPlayedInstruments < ActiveRecord::Migration
  def change
    create_table :user_played_instruments do |t|
      t.integer :user_id
      t.integer :instrument_id

      t.timestamps
    end
  end
end
