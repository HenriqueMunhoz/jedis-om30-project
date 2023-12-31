class Municipe < ApplicationRecord
  searchkick

  has_one :address, dependent: :destroy
  accepts_nested_attributes_for :address, allow_destroy: true

  validates :full_name, :cpf, :cns, :email, :birth_date, :phone, :photo, presence: true
  validates :cpf, :cns, :email, uniqueness: true

  validate :valid_cpf?, :valid_cns?
  validates :email, email: true
  validates_comparison_of :birth_date,
                          greater_than_or_equal_to: Date.new(1920, 1, 1),
                          less_than_or_equal_to: Time.zone.today

  def valid_cpf?
    errors.add(:cpf, :invalid) unless CPF.valid?(cpf)
  end

  def valid_cns?
    errors.add(:cns, :invalid) unless cns.delete(' ').strip.length == 15
  end

  def translated_status
    status ? 'Ativo' : 'Inativo'
  end
end
