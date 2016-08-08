class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :confirmable

  has_many :affiliations
  has_many :works
  has_many :teams, through: :affiliations
  has_one :my_affiliation, -> { where(ownership: true) }, class_name: 'Affiliation'
  has_one :my_team, through: :my_affiliation, source: :team

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
