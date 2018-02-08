class Company < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  has_many :jobs, dependent: :destroy

  def self.top_three_by_interest
    joins(:jobs)
  end
end
