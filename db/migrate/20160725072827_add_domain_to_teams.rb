class AddDomainToTeams < ActiveRecord::Migration[5.0]
  def change
    add_column :teams, :domain, :string
  end
end
