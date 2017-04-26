require 'rails_helper'
require 'faker'

RSpec.describe AdsController, type: :controller do
  let(:user) { User.create!(name: Faker::Name.name, email: Faker::Internet.email, password: Faker::Crypto.sha1) }

  before { sign_in(user) }

  render_views

  let(:event) { Event.create(title: Faker::HowIMetYourMother.catch_phrase, description: Faker::HowIMetYourMother.quote, termination_date: Faker::Time.forward(1, :morning), user_id: user.id) }
  let(:valid_attributes) { { title: Faker::HowIMetYourMother.catch_phrase, description: Faker::HowIMetYourMother.quote, event_id: event.id, user_id: user.id } }
  let(:invalid_attributes) { { title: '', description: Faker::HowIMetYourMother.quote, event_id: event.id, user_id: user.id } }

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
      expect(response).to render_template :show
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
      expect(response).to render_template :new
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
        expect { post :create, params: { event_id: event.id, ad: invalid_attributes } }.to_not change(Ad, :count)
      end
      it 're-renders the new method' do
        post :create, params: { event_id: event.id, ad: invalid_attributes }
        expect(response).to render_template :new
      end
    end
  end

  describe 'PUT #update' do
    before :each do
      @ad = Ad.create valid_attributes
    end
    context 'valid attributes' do
      let(:new_attributes) { { description: Faker::HowIMetYourMother.quote } }
      it 'updates an existing ad' do
        put :update, params: { event_id: event.id, id: @ad.to_param, ad: new_attributes }
        @ad.reload
        expect(@ad.description).to eq(new_attributes[:description])
      end
      it 'redirects to the updated ad' do
        put :update, params: { event_id: event.id, id: @ad.to_param, ad: new_attributes }
        expect(response).to redirect_to event_ad_path(event_id: event.id, id: @ad)
      end
    end
    context 'invalid attributes' do
      let(:new_attributes) { { description: '' } }
      it 'it does not update the existing ad' do
        put :update, params: { event_id: event.id, id: @ad.to_param, ad: new_attributes }
        @ad.reload
        expect(@ad.description).to_not eq(new_attributes[:description])
      end
    end
  end

  describe 'DELETE #destroy' do
    before :each do
      @ad = Ad.create valid_attributes
    end
    it 'deletes the ad' do
      expect do
        delete :destroy, params: { event_id: event.id, id: @ad }
      end.to change(Ad, :count).by(-1)
    end
    it 'redirects to events#show' do
      delete :destroy, params: { event_id: event.id, id: @ad }
      expect(response).to redirect_to event_path(@ad.event_id)
    end
  end
end
