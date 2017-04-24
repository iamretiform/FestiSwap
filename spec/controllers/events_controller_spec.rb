require 'rails_helper'

RSpec.describe EventsController, type: :controller do
  let(:valid_attributes) { { title: 'bob', description: 'top' } }
  let(:invalid_attributes) { { title: '', description: 'top' } }

  describe "GET #index" do
    it "responds successfully with an HTTP 200 status code" do
      get :index
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end

    it "renders the index template" do
      get :index
      expect(response).to render_template("index")
    end

    it "loads all of the events into @events" do

      event1 = Event.create!(valid_attributes)
      event2 = Event.create!(valid_attributes)
      get :index

      expect(assigns(:events)).to match_array([event1, event2])
    end
  end
  describe 'GET #new' do
    it 'responds successfully with an HTTP 200 status code' do
      get :new
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end

    it 'renders the new event template' do
      get :new
      expect(response).to render_template('events/new')
    end
  end
end
