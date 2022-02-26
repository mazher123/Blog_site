class CreateCategories < ActiveRecord::Migration[7.0]
  def change
    create_table :categories do |t|
      t.string :name
      t.string :type
      t.string :is_active
      t.timestamps
    end
  end
end
