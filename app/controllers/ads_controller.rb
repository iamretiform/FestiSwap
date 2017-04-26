class AdsController < ApplicationController
  before_action :set_user
  before_action :set_ads
  before_action :set_ad, only: %i[show edit update destroy]

  def show; end

  def new
    @ad = @event.ads.build
  end

  def edit; end

  def create
    @ad = @event.ads.new(ad_params)

    if @ad.save
      redirect_to([@ad.event, @ad], notice: 'Ad was successfully created.')
    else
      render action: 'new'
    end
  end

  def update
    if @ad.update_attributes(ad_params)
      redirect_to([@ad.event, @ad], notice: 'Ad was successfully updated.')
    else
      render action: 'edit'
    end
  end

  def destroy
    @ad.destroy
    redirect_to event_path(@event)
  end

  private

  def set_ads
    @event = Event.find(params[:event_id])
  end

  def set_user
    @user = current_user.id
  end

  def set_ad
    @ad = @event.ads.find(params[:id])
  end

  def ad_params
    params.require(:ad).permit(:title, :description).merge(event_id: @event, user_id: @user)
  end
end
