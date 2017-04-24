require 'rails_helper'

RSpec.describe AdsController, type: :controller do
  let(:event) { Event.create(title: 'World Fair', description: 'Greatest show on earth.') }
  let(:valid_attributes) { { title: 'bob', description: 'top', event_id: event.id } }
  let(:invalid_attributes) { { title: '', description: 'top', event_id: event.id } }

  describe 'GET #show' do
    it 'responds successfully with an HTTP 200 status code' do
      get :show, params: {event_id: event.id}
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end

    it 'renders the show template' do
      get :show, params: {event_id: event.id}
      expect(response).to render_template('show')
    end

    it 'loads all of the ads into @ads' do
      ad = Ad.create!(valid_attributes)
      get :show, params: {event_id: event.id}

      expect(assigns(:ads)).to match_array([ad1, ad2])
    end
  end
  describe 'GET #create' do
    it 'responds successfully with an HTTP 200 status code' do
      get :create, params: {event_id: event.id}
      byebug
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end

    it 'renders the create ad template' do
      get :create, params: {event_id: event.id}
      expect(response).to render_template('ads/new')
    end
  end
  describe 'GET #create' do
    it 'responds successfully with an HTTP 200 status code' do
      get :create, params: {event_id: event.id}
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end

    it 'renders the create ad template' do
      get :create, params: {event_id: event.id}
      expect(response).to render_template('ads/new')
    end
  end
  describe 'POST #create' do
    it 'creates a new ad' do
      expect { post :create, params: { event_id: 8, ad: valid_attributes } }.to change(Ad, :count).by(1)
    end
  end
end
