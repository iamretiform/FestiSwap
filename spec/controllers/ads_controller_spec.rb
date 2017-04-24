require 'rails_helper'

RSpec.describe AdsController, type: :controller do
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

    it 'loads all of the ads into @ads' do
      ad1 = Ad.create!
      ad2 = Ad.create!
      get :index

      expect(assigns(:ads)).to match_array([ad1, ad2])
    end
  end
  describe 'GET #create' do
    it 'responds successfully with an HTTP 200 status code' do
      get :create
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end

    it 'renders the create ad template' do
      get :create
      expect(response).to render_template('create')
    end

    it 'create ad with title and description' do
      Ad.create(title: 'Hello World', description: 'This is a test.', event_id: 1)
      get :create

      expect(response(:ads)).to include('Hello World')
      expect(response(:ads)).to include('This is a test.')
    end
  end
end
