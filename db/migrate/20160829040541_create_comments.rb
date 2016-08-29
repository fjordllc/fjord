class CreateComments < ActiveRecord::Migration[5.0]
  def change
    create_table :comments do |t|
      t.text :body
      t.date :date
      t.belongs_to :user, foreign_key: true
      t.integer :owner_id

      t.timestamps
    end

    add_foreign_key :comments, :users, column: :owner_id
  end
end
