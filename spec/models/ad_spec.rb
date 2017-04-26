require 'rails_helper'

RSpec.describe Ad, type: :model do
  it 'has a valid factory' do
    ad = build(:ad)
    expect(ad).to be_valid
  end
  describe Ad do
    it { is_expected.to validate_presence_of(:title) }
    it { is_expected.to validate_presence_of(:description) }
    it { is_expected.to validate_presence_of(:user_id) }
    it { is_expected.to validate_presence_of(:termination_date) }
  end
end
