class EventsController < ApplicationController
  before_action :authenticate_user!, only: %i[new create edit update destroy]
  before_action :set_user, only: %i[new create edit update destroy]
  before_action :find_event, only: %i[show edit update destroy]

  def index
    @events = SearchesEvents.new(query: params[:q]).call
  end

  def show
    @ads = @event.ads
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)
    if @event.save
      DeleteEventWorker.perform_at(@event.termination_date + 1.day, @event.id)
      redirect_to event_path(@event), notice: 'Your event was successfully created.'
    else
      render :new
    end
  end

  def edit; end

  def update
    if @event.update(event_params)
      redirect_to event_path(@event), notice: 'Your event was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @event.destroy
    respond_to do |format|
      format.html { redirect_to events_url, notice: 'Your event was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def find_event
    @event = Event.friendly.find(params[:id])
  end

  def set_user
    @user = current_user.id
  end

  def event_params
    params.require(:event).permit(:title, :description, :start_date, :termination_date, :file, :address, :radius, :slug, :theme_song).merge(user_id: @user)
  end
end
