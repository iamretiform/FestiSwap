class AdsController < ApplicationController
  before_action :set_ads
  before_action :set_ad, only: [:show, :edit, :update, :destroy]

  # GET events/1/ads
  def index
    @ads = @event.ads
  end

  # GET events/1/ads/1
  def show
  end

  # GET events/1/ads/new
  def new
    @ad = @event.ads.build
  end

  # GET events/1/ads/1/edit
  def edit
  end

  # POST events/1/ads
  def create
    @ad = @event.ads.build(ad_params)

    if @ad.save
      redirect_to([@ad.event, @ad], notice: 'Ad was successfully created.')
    else
      render action: 'new'
    end
  end

  # PUT events/1/ads/1
  def update
    if @ad.update_attributes(ad_params)
      redirect_to([@ad.event, @ad], notice: 'Ad was successfully updated.')
    else
      render action: 'edit'
    end
  end

  # DELETE events/1/ads/1
  def destroy
    @ad.destroy

    redirect_to event_ads_url(@event)
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_ads
    @event = Event.find(params[:event_id])
  end

  def set_ad
    @ad = @event.ads.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def ad_params
    params.permit(:title, :description).merge(event_id: @event)
  end
end
