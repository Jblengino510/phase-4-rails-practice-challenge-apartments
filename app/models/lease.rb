class Lease < ApplicationRecord
  belongs_to :apartment
  belongs_to :tenant

  validates :rent, numericality: { only_integer: true, greater_than_or_equal_to: 1000 }
end
