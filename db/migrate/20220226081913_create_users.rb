class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :name
      t.string :phone
      t.string :email
      t.string :password
      t.string :role
      t.string :image
      t.string :is_active
      t.timestamps
    end
  end
end