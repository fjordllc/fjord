class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :confirmable

  has_many :affiliations
  has_many :transactions
  has_many :notes
  has_many :teams, through: :affiliations
  has_one :my_affiliation, -> { where(ownership: true) }, class_name: 'Affiliation'
  has_one :my_team, through: :my_affiliation, source: :team

  def projects
    Project.where(team_id: teams.ids)
  end

  def current_transaction
    transactions.active.order(id: :desc).limit(1).try(:first)
  end

  def current_project
    current_transaction.try(:project)
  end

  def create_my_team
    transaction do
      unless my_team
        team = Team.create!
        Affiliation.create!(
          user: self,
          team: team,
          ownership: true
        )
      end
    end
  end
end
