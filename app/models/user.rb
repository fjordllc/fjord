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

  validates :first_name, presence: true
  validates :last_name, presence: true

  has_attached_file :avatar,
    styles: { normal: '100x100>', thumb: '64x64>' }
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/

  def projects
    Project.where(team_id: teams.ids)
  end

  def team_users
    user_ids = Affiliation.distinct(:user_id).where(team_id: teams.ids).pluck(:user_id)
    User.where(id: user_ids)
  end

  def team_user?(user)
    team_users.where(id: user.id).exists?
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

  def full_name
    "#{last_name} #{first_name}"
  end
end
