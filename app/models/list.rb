class List < ApplicationRecord
  has_many :bookmarks, dependent: :destroy
  has_many :movies, through: :bookmarks
  has_many :list
  validates :name, presence: true
  validates :name, uniqueness: true
end