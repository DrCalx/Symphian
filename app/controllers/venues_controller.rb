class VenuesController < ApplicationController
  def new
    @venue = Venue.new
  end
  
  def create
    @venue = Venue.new(venue_params)
    if @venue.save
      redirect_to @venue
    else
      flash[:error] = "Couldn't save"
      render 'new'
    end
  end
  
  def show
    @venue = Venue.find(params[:id])
  end
  
  def destroy
    Venue.find(params[:id]).destroy
    flash[:success] = "Venue Destroyed"
    redirect_to request.referrer
  end
  
  private
  def venue_params
    params.require(:venue).permit(:name)
  end
end