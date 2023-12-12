# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Municipe do
  it 'is valid with valid attributes' do
    expect(build(:municipe)).to be_valid
  end

  it 'is not valid without a name' do
    municipe = build(:municipe, full_name: nil)

    expect(municipe).not_to be_valid
  end

  it 'is not valid without a cpf' do
    municipe = build(:municipe, cpf: nil)

    expect(municipe).not_to be_valid
  end
end
