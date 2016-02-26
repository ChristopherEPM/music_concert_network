class ConcertsController < ApplicationController

  def new
    @concert = Concert.new
  end

  def index
    @concerts_tm = Concert.concerts_this_month
    @concerts_tod = Concert.concerts_today
    #render 'index'
  end

  def show
    @concert = Concert.find(params[:id])
  end

  def create
    @concert = Concert.new concert_params
    if @concert.save
      flash[:notice] = "Concert created successfully"
      redirect_to action: :index, controller: 'concerts' #action le indicamos a que parte de este entries_controller le estamos redirirgiendo (sin renderizar vista), controller indica a que controller debe ir
    else
      @errors = @concert.errors.full_messages
      flash[:alert] = "Something was wrong"
      render 'new'
    end

  end

  private

  def concert_params
    params.require(:concert).permit(:artist, :venue, :city, :price, :date, :description)
  end


end
