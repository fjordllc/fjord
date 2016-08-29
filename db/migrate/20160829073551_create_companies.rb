class CreateCompanies < ActiveRecord::Migration[5.0]
  def change
    create_table :companies do |t|
      t.string :name
      t.text :website
      t.text :description
      t.belongs_to :team, foreign_key: true

      t.timestamps
    end
  end
end
