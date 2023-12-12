class Address < ApplicationRecord
  belongs_to :municipe
  validates :zip_code, :street, :neighborhood, :city, :state, presence: true
end
