require 'rails_helper'

RSpec.describe Event, type: :model do
  it 'has a valid factory' do
    event = build(:event)
    expect(event).to be_valid
  end

  describe Event do
    xit { is_expected.to validate_presence_of(:title) }
    xit { is_expected.to validate_presence_of(:description) }
  end
end
