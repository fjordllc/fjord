class CreateTransactions < ActiveRecord::Migration[5.0]
  def change
    create_table :transactions do |t|
      t.timestamp :started_at
      t.timestamp :finished_at
      t.belongs_to :user, foreign_key: true
      t.belongs_to :project, foreign_key: true

      t.timestamps
    end
  end
end
