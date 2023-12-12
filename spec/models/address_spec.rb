# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Address do
  it 'is valid with valid attributes' do
    expect(build(:address)).to be_valid
  end

  it 'is not valid without a zip_code' do
    address = build(:address, zip_code: nil)

    expect(address).not_to be_valid
  end
end
