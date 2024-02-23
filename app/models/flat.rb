class Flat < ApplicationRecord
  validates :name, :address, :description, :price_per_night, :number_of_guests, presence: true

  def picture_url

    self[:picture_url]
  end
end
