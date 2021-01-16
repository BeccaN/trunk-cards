class AddColumnCategoryIdToGroups < ActiveRecord::Migration[6.0]
  def change
    add_column :groups, :category_id, :integer
  end
end
