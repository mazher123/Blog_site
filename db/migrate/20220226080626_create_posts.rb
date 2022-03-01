class CreatePosts < ActiveRecord::Migration[7.0]
  def change
    create_table :posts do |t|
      t.string :title
      t.string :author
      t.text   :content
      t.string :image
      t.int    :user_id
      t.timestamps
    end
  end
end
