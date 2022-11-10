class PairingsController < ApplicationController
  before_action :set_pairing, only: [:show, :edit, :update, :destroy]

  # GET /pairings
  def index
    @pairings = Pairing.all
  end

  # GET /pairings/1
  def show
  end

  # GET /pairings/new
  def new
    @pairing = Pairing.new
  end

  # GET /pairings/1/edit
  def edit
  end

  # POST /pairings
  def create
    @pairing = Pairing.new(pairing_params)

    if @pairing.save
      redirect_to @pairing, notice: 'Pairing was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /pairings/1
  def update
    if @pairing.update(pairing_params)
      redirect_to @pairing, notice: 'Pairing was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /pairings/1
  def destroy
    @pairing.destroy
    redirect_to pairings_url, notice: 'Pairing was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pairing
      @pairing = Pairing.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def pairing_params
      params.fetch(:pairing, {})
    end
end
