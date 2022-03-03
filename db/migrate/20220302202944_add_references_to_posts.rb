class AddReferencesToPosts < ActiveRecord::Migration[7.0]
  def change
    def up
    add_reference :posts, :category, foreign_key: true
    end
    def down
      remove_reference :posts, :category, foreign_key: true
    end
  end
end
