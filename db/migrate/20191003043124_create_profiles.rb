class CreateProfiles < ActiveRecord::Migration[5.2]
  def change
    create_table :profiles do |t|
      t.references :spree_user, foreign_key: true
      t.string :first_name
      t.string :last_name
      t.boolean :can_blog, default: false

      t.timestamps
    end
  end
end
