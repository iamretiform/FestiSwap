class EventsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  before_action :set_user, only: [:new, :create, :edit, :update, :destroy]
  before_action :find_event, only: %i[show edit update destroy]

  def index
    @events = Event.all
  end

  def show
    @ads = @event.ads
  end

  def new
    @event = Event.new
  end



  def create
    @event = Event.new(event_params)

    respond_to do |format|
      if @event.save
        DeleteEventWorker.perform_at(@event.termination_date + 1.day, @event.id)
        format.html { redirect_to @event, notice: 'Event was successfully created.' }
        format.json { render :show, status: :created, location: @event }
      else
        format.html { render :new }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
  end

   def update
     @event = Event.find(params[:id])
     @event.update(title: params[:title], description: params[:description])
     redirect_to event_path(@event)
   end

  def destroy
    @event.destroy
    respond_to do |format|
      format.html { redirect_to events_url, notice: 'Event was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def find_event
    @event = Event.find(params[:id])
  end

  def set_user
    @user = current_user.id
  end

  def event_params
    params.require(:event).permit(:title, :description, :termination_date).merge(user_id: @user)
  end
end
