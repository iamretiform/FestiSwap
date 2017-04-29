class AdsController < ApplicationController
  before_action :authenticate_user!, only: %i[new create edit update destroy delete_ad_file]
  before_action :find_ad, only: %i[show edit destroy update delete_ad_file]
  before_action :find_event, only: %i[show new create destroy edit update delete_ad_file]
  before_action :find_user, only: %i[new create edit update destroy]

  def new
    @ad = @event.ads.new
  end

  def create
    @ad = @event.ads.new ad_params
    if @ad.save
      DeleteAdWorker.perform_at(@ad.termination_date + 1.day, @ad.id)
      redirect_to [@event, @ad], notice: 'Awesome! You generated ad!'
    else
      render :new, notice: 'Oops, something went wrong! Sorry!'
    end
  end

  def show; end

  def update
    if @event.ads.update(ad_params)
      redirect_to [@event, @ad], notice: 'Your ad was successfully updated!'
    end
  end

  def edit; end

  def destroy
    @ad.destroy
    redirect_to event_path(@event)
  end

  def delete_ad_file
    @ad.file.destroy
    redirect_to edit_event_ad_path(@event, @ad), notice: 'File has successfully been removed.'
  end

  private

  def find_event
    @event = Event.find(params[:event_id])
  rescue ActiveRecord::RecordNotFound
    render 'errors/not_found', status: :not_found
  end

  def ad_params
    params.require(:ad).permit(:title, :description, :termination_date, :file).merge(event_id: @event.id, user_id: @user)
  end

  def find_user
    @user = current_user.id
  end

  def find_ad
    @ad = Ad.find(params[:id])
  end
end
