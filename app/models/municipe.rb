class Municipe < ApplicationRecord
  validates :full_name, :cpf, :cns, :email, :birth_date, :phone, :photo, :status, presence: true
  validates :cpf, :cns, :email, uniqueness: true
  # Add more validations as needed
end
