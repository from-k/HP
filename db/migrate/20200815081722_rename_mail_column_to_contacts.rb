class RenameMailColumnToContacts < ActiveRecord::Migration[5.2]
  def change
    rename_column :contacts, :mail, :email
  end
end
