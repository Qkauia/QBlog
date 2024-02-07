class RemoveCategoryFromPosts < ActiveRecord::Migration[7.1]
  def change
    remove_column :posts, :category, :string
  end
end
