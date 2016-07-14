class Team < ApplicationRecord
  has_many :affiliations
  has_many :users, through: :affiliations
  has_one :owner_affiliation, -> { where(ownership: true) }, class_name: 'Affiliation'
  has_one :owner, through: :owner_affiliation, source: :user
end
