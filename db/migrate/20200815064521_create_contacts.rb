class CreateContacts < ActiveRecord::Migration[5.2]
  def change
    create_table :contacts do |t|
      t.string :company
      t.string :name
      t.string :mail
      t.integer :tel
      t.integer :opportunity_to_know
      t.text :opportunity_to_know_other
      t.text :content
      t.integer :status

      t.timestamps
    end
    add_index :contacts, :created_at
    add_index :contacts, :status
  end
end
