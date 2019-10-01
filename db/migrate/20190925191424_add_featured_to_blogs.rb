class AddFeaturedToBlogs < ActiveRecord::Migration[5.2]
  def change
    add_column :blogs, :big_feature, :boolean, default: false
    add_column :blogs, :featured, :boolean, default: false
    add_column :blogs, :most_popular, :boolean, default: false
  end
end
