class Affiliation < ApplicationRecord
  belongs_to :user
  belongs_to :team

  validates :user_id, uniqueness: { scope: [:team_id] }
  validates :team_id, uniqueness: { scope: [:user_id] }
  validate :owner_only_one

  def owner_only_one
    if owner_exists? && ownership
      errors[:base] << 'チームの管理者は一人だけです。'
    end
  end

  def owner_exists?
    Affiliation.where(
      team_id: team_id,
      ownership: true
    ).exists?
  end
end
