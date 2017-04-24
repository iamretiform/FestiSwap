require 'rails_helper'

RSpec.describe AdsController, type: :controller do
  let(:event) { Event.create(title: 'World Fair', description: 'Greatest show on earth.') }
  let(:valid_attributes) { { title: 'bob', description: 'top', event_id: event.id } }
  let(:invalid_attributes) { { title: '', description: 'top', event_id: event.id } }

  describe 'GET #show' do
    it 'responds successfully with an HTTP 200 status code' do
      ad = Ad.create!(valid_attributes)
      get :show, params: { event_id: event.id, id: ad.id }
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end

    it 'renders the show template' do
      ad = Ad.create!(valid_attributes)
      get :show, params: { event_id: event.id, id: ad.id }
      expect(response).to render_template('show')
    end
  end
  describe 'GET #new' do
    it 'responds successfully with an HTTP 200 status code' do
      get :new, params: { event_id: event.id }
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end

    it 'renders the new ad template' do
      get :new, params: { event_id: event.id }
      expect(response).to render_template('ads/new')
    end
  end
  describe 'POST #create' do
    context 'with valid attributes' do
      it 'creates a new ad' do
        expect { post :create, params: { event_id: event.id, ad: valid_attributes } }.to change(Ad, :count).by(1)
      end
      it 'redirects to the new ad' do
        post :create, params: { event_id: event.id, ad: valid_attributes }
        expect(response).to redirect_to event_ad_path(event_id: event.id, id: Ad.last.id)
      end
    end
    context 'with invalid attributes' do
      it 'does not save the new ad' do
        expect do
          post :create, params: { event_id: event.id, ad: invalid_attributes }
        end.to_not change(Ad, :count)
      end
      it 're-renders the new method' do
        post :create, params: { event_id: event.id, ad: invalid_attributes }
        expect(response).to render_template :new
      end
    end
  end
end
