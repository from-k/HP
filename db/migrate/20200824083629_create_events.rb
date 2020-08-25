class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|
      t.string  :title
      t.string  :content
      t.string  :event_image
      t.date    :holded_at, index: true
      t.integer :tag, index: true

      t.timestamps
    end
  end
end
