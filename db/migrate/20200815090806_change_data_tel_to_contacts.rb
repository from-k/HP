class ChangeDataTelToContacts < ActiveRecord::Migration[5.2]
  def change
    change_column :contacts, :tel, :string
  end
end
