class AirplanesController < ApplicationController
  def index
    @airplanes = Airplane.all
    count = cookies[:visit_count] || 1
    cookies[:visit_count] = count.to_i + 1
  end

  def new
    @airplane = Airplane.new
  end

  def create
    @airplane = Airplane.new(airplane_params)
    if @airplane.save
      redirect_to @airplane
    else
      # TODO: store error messages in the flash hash
      render :new
    end
  end

  def show
    @airplane = Airplane.find(params[:id])
  end

  def airplane_params
    params.require(:airplane).permit(:name, :description)
  end
  def create
    @airplane = Airplane.new(airplane_params)
      if @airplane.save
        redirect_to @airplane
      else
        flash[:error] = airplane.errors.full_messages.join(" bad info")
        render :new
      end
    end
end
