require 'rails_helper'

RSpec.describe EventsController, type: :controller do

  describe "POST #create" do
    context "with valid attributes" do
      it "create new event" do
        post :create, event: attributes_for(:event)
        expect(Event.count).to eq(1)
      end
    end
  end
end