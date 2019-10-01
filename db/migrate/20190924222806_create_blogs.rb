class CreateBlogs < ActiveRecord::Migration[5.2]
  def change
    create_table :blogs do |t|
      t.string :title
      t.string :teaser
      t.text :body
      t.boolean :published, default: false
      t.datetime :published_at
      t.string :featured_image_url
      t.references :spree_user, foreign_key: true
      t.string :pin_1_url
      t.string :pin_2_url
      t.string :pin_3_url
      t.string :pin_4_url

      t.timestamps
    end
  end
end
