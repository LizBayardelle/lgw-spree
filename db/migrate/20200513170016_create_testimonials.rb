class CreateTestimonials < ActiveRecord::Migration[5.2]
  def change
    create_table :testimonials do |t|
      t.string :title
      t.string :description
      t.boolean :airblades, default: false
      t.boolean :fans, default: false
      t.boolean :vacuums, default: false
      t.boolean :lighting, default: false
      t.boolean :accessories, default: false
      t.boolean :homepage, default: false
      t.boolean :category_pages, default: false
      t.boolean :testimonials, default: false

      t.timestamps
    end
  end
end
