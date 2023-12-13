class MunicipesController < ApplicationController
  def index
    @municipes = Municipe.all
  end

  def show
    @municipe = Municipe.find(params[:id])
    @address = @municipe.address
  end

  def new
    @municipe = Municipe.new
  end

  def edit
    @municipe = Municipe.find(params[:id])
  end

  def create
    @municipe = Municipe.new(municipe_params)
    if @municipe.save
      redirect_to @municipe
    else
      render :new
    end
  end

  def update
    @municipe = Municipe.find(params[:id])
    if @municipe.update(municipe_params)
      redirect_to @municipe
    else
      render :edit
    end
  end

  private

  def municipe_params
    params.require(:municipe).permit(
      :full_name, :cpf, :cns, :email, :birth_date, :phone, :photo, :status,
      addresses_attributes: [:zip_code, :street, :neighborhood, :city, :state]
    )
  end
end
