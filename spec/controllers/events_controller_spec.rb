require 'rails_helper'

RSpec.describe EventsController, type: :controller do
  describe 'GET #index' do
    it 'responds successfully with an HTTP 200 status code' do
      get :index
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end

    it 'renders the index template' do
      get :index
      expect(response).to render_template('index')
    end

    it 'loads all of the events into @events' do
      event = Event.create!
      get :index

      expect(assigns(:events)).to match_array([event])
    end
  end
  describe 'GET #create' do
    it 'responds successfully with an HTTP 200 status code' do
      get :create
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end

    it 'renders the create event template' do
      get :create
      expect(response).to render_template('create')
    end

    it 'create event with title and description' do
      Event.create(title: 'Hello World', description: 'This is a test.', event_id: 1)
      get :create

      expect(response(:events)).to include('Hello World')
      expect(response(:events)).to include('This is a test.')
    end
  end
end
