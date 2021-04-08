class CreateAttendableEvents < ActiveRecord::Migration[6.1]
  def change
    create_table :attendable_events do |t|
      t.string :attended_event_id
      t.string :event_attendee_id

      t.timestamps
    end
    add_index :attendable_events, :attended_event_id
    add_index :attendable_events, :event_attendee_id
  end
end
