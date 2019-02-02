class Team < ApplicationRecord
  obfuscatable

  has_many :users
  has_many :beans
  has_many :purchases, through: :users
end
