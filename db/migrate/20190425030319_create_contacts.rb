class CreateContacts < ActiveRecord::Migration[5.2]
  def change
    create_table :contacts do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :phone
      t.string :preferred_contact
      t.string :subject
      t.text :message
      t.boolean :responded, default: false
      t.boolean :archived, default: false

      t.timestamps
    end
  end
end
