class CreateAffiliations < ActiveRecord::Migration[5.0]
  def change
    create_table :affiliations do |t|
      t.belongs_to :user, foreign_key: true
      t.belongs_to :team, foreign_key: true
      t.boolean :ownership, null: false, default: false
    end

    add_index :affiliations, [:user_id, :team_id], :unique => true
  end
end
