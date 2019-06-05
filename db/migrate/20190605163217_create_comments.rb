class CreateComments < ActiveRecord::Migration[5.1]
  def change
    create_table :comments do |t|
      t.integer :user_id
      t.string :body
      t.integer :detail_id

      t.timestamps
    end
  end
end
