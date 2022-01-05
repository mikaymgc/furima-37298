class BuysController < ApplicationController
  before_action :authenticate_user!, except: :index

  def index
    @buy_destination = BuyDestination.new
    @item = Item.find(params[:item_id])
  end

  def create
    @item = Item.find(params[:item_id])
    @buy_destination = BuyDestination.new(destination_params)
    if @buy_destination.valid?
      @buy_destination.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def destination_params
    params.permit(:postcode, :prefecture, :city, :addresses, :building, :phone_number).merge(user_id: current_user.id, item_id: @item.id)
  end

end
