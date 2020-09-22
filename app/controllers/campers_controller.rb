class CampersController < ApplicationController
  def index
    @campers = Camper.all
  end

  def show
    @camper = Camper.find(params[:id])
  end

  def new
    @camper = Camper.new
  end

  def create
    @camper = Camper.create(camp_params)
    if @camper.valid?
      redirect_to camper_path(@camper)
    else
      flash[:camper_errors]= @camper.errors.full_messages
    end
  end

  private

  def camp_params
    params.require(:camper).permit(:name, :age)  
  end
end
