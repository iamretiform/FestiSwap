require 'rails_helper'

RSpec.describe EventsController, type: :controller do
  let(:valid_attributes) { { title: 'bob', description: 'top' } }
  let(:invalid_attributes) { { title: '', description: 'top' } }
  # let(:id) { { 'events/:id' } }

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

  describe 'POST #create' do
    context 'with valid attributes' do
      it 'creates a new event' do
        expect { post :create, params: { event: valid_attributes } }.to change(Event, :count).by(1)
      end

      it 'redirects to the new event' do
        post :create, params: { event: valid_attributes }
        expect(response).to redirect_to event_path(id: Event.last.id)
      end
    end

    context 'with invalid attributes' do
      it 'does not save the new event' do
        expect { post :create, params: { event: invalid_attributes } }.to_not change(Event, :count)
      end

      it 're-renders the new method' do
        post :create, params: { event: invalid_attributes }
        expect(response).to render_template :new
      end
    end
  end

  describe 'DELETE #destroy' do
    before :each do
      @event = Event.create valid_attributes
    end
    it 'deletes the event' do
      expect { delete :destroy, params: { id: @event } }.to change(Event, :count).by(-1)
    end

    it 'redirects to ads#index' do
      delete :destroy, params: { id: @event }
      expect(response).to redirect_to events_path
    end
  end

  describe 'PUT #update' do
      before :each do
        @event = Event.create valid_attributes
      end
      context 'valid attributes' do
        let(:new_attributes) { { description: Faker::Name.name } }
        it 'updates an existing event' do
          put :update, params: { id: @event.to_param, event: new_attributes }
          @event.reload
          expect(@event.description).to eq(new_attributes[:description])
        end
        it 'redirects to the updated event' do
          put :update, params: { id: @event.to_param, event: new_attributes }
          expect(response).to redirect_to event_path(id: @event)
        end
      end
      context 'invalid attributes' do
        let(:new_attributes) { { description: '' } }
        it 'it does not update the existing event' do
          put :update, params: { id: @event.to_param, event: new_attributes }
          @event.reload
          expect(@event.description).to include(new_attributes[:description])
        end
        it 're-renders the edit method' do
          put :update, params: { id: @event.to_param, event: new_attributes }
          expect(response).to render_template :edit
        end
      end
    end
end
