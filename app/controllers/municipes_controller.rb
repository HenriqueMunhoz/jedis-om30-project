class MunicipesController < ApplicationController
  before_action :set_municipe, only: [:edit, :update]

  def index
    Municipe.reindex

    params[:search] = '*' if params[:search].blank?

    @municipes = Municipe.search(
      params[:search],
      page: params[:page], per_page: 20
    )
  end

  def new
    @municipe = Municipe.new
    @municipe.build_address
  end

  def edit; end

  def create
    @municipe = Municipe.new(municipe_params)

    respond_to do |format|
      if @municipe.save
        format.html { redirect_to municipes_path, notice: 'Municipe foi criado com sucesso' }
        format.json { render :index, status: :created, location: @municipe }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @municipe.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @municipe.update(municipe_params)
        format.html { redirect_to municipes_path, notice: 'Municipe foi editado com sucesso' }
        format.json { render :index, status: :ok, location: @municipe }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @municipe.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def set_municipe
    @municipe = Municipe.find(params[:id])
  end

  def municipe_params
    params.require(:municipe).permit(
      :full_name, :cpf, :cns, :email, :birth_date, :phone, :photo, :status,
      address_attributes: [:id, :zip_code, :street, :neighborhood, :city, :state, :complement, :ibge_code]
    )
  end
end
