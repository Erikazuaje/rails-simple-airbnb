class FlatsController < ApplicationController
  before_action :set_flat, only: [:show, :edit, :update, :destroy]

  def index
    @flats = Flat.all
  end

  def show
    # No se necesita ninguna lógica adicional aquí, ya que ya hemos recuperado el apartamento mediante el before_action.
  end

  def new
    @flat = Flat.new
  end

  def create
    @flat = Flat.new(flat_params)

    if @flat.save
      redirect_to @flat, notice: 'Apartment was successfully created.'
    else
      render :new
    end
  end

  def edit
    # No se necesita ninguna lógica adicional aquí, ya que ya hemos recuperado el apartamento mediante el before_action.
  end

  def update
    if @flat.update(flat_params)
      redirect_to @flat, notice: 'Apartment was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @flat.destroy
    redirect_to flats_url, notice: 'Apartment was successfully destroyed.'
  end

  private

  def set_flat
    @flat = Flat.find(params[:id])
  end

  def flat_params
    params.require(:flat).permit(:name, :address, :description, :price_per_night, :number_of_guests)
  end
end
