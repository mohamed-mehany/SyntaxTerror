class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.belongs_to :user, index: true
      t.integer :user_id
      t.text :body
      t.references :post, index: true
      t.timestamps null: false
    end
    add_foreign_key :comments, :posts
  end
end
