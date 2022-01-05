class BuysController < ApplicationController
  before_action :authenticate_user!, except: :index
  before_action :authenticate_user!, only: [:index, :create]


  def index
    @buy_destination = BuyDestination.new
  end

  def create
    @buy_destination = BuyDestination.new(destination_params)
    if @buy_destination.valid?
      @buy_destination.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def set_item
    @item = Item.find(params[:item_id])
  end

  def destination_params
    params.require(:buy_destination).permit(:postcode, :prefecture_id, :city, :addresses, :building, :phone_number).merge(user_id: current_user.id, item_id: @item.id)
  end

end
