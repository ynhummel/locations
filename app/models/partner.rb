class Partner < ApplicationRecord
  validates :document, uniqueness: true
  validates :trading_name, :owner_name, :document, :coverage_area , :address, presence: true
end
