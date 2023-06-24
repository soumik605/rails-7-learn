class Quote < ApplicationRecord
  validates :name, presence: true
  validates_uniqueness_of :name

  scope :ordered, -> { order(id: :desc) }
end
