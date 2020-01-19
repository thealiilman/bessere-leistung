require 'rails_helper'

RSpec.describe Author, type: :model do
  describe 'associations' do
    it { should have_many(:books) }
  end

  describe 'validations' do
    it { should validate_presence_of(:name) }
  end
end
