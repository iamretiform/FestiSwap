class AdsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  before_action :find_ad, only: [:show, :edit, :destroy, :update]
  before_action :find_event, only: [:show, :new, :create, :destroy, :edit, :update]
  before_action :find_user, only: [:new, :create, :edit, :update, :destroy]

  def new
    @ad = @event.ads.new
  end

  def create
    @ad = @event.ads.new ad_params
    if @ad.save
      redirect_to [@event, @ad], notice: "Awesome! You generated ad!"
    else
      render :new, notice: "Oops, something went wrong! Sorry!"
    end
  end

  def show
  end

  def update
    if @event.ads.update(ad_params)
      redirect_to [@event, @ad], notice: "Your ad was sucessfully updated!"
    end
  end

  def edit
  end

  def destroy
    @ad.destroy
    redirect_to event_path(@event)
  end

  private
  def find_event
    @event = Event.find(params[:event_id])
  rescue ActiveRecord::RecordNotFound
    render "errors/not_found", status: :not_found
  end

  def ad_params
    params.require(:ad).permit(:title, :description).merge(event_id: @event.id, user_id: @user)
  end

  def find_user
    @user = current_user.id
  end

  def find_ad
    @ad = Ad.find(params[:id])
  end
end
