class MunicipesController < ApplicationController
  before_action :set_municipe, only: %i[edit update]

  def index
    @municipes = Municipe.all
  end

  def new
    @municipe = Municipe.new
    @municipe.build_address
  end

  def edit
  end

  def create
    @municipe = Municipe.new(municipe_params)

    respond_to do |format|
      if @municipe.save
        format.html { redirect_to municipes_path, notice: "Municipe foi criado com sucesso" }
        format.json { render :index, status: :created, location: @municipe }
      else
        # Recriar o objeto de endereço se não passar na validação
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @municipe.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @municipe.update(municipe_params)
        format.html { redirect_to municipes_path, notice: "Municipe foi editado com sucesso" }
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
        address_attributes: [:id, :zip_code, :street, :neighborhood, :city, :state]
      )
    end
end
