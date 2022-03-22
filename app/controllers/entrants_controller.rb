class EntrantsController < ApplicationController
  before_action :set_entrant, only: %i[ show edit update destroy ]

  # GET /entrants or /entrants.json
  def index
    @entrants = Entrant.all
  end

  # GET /entrants/1 or /entrants/1.json
  def show
  end

  # GET /entrants/new
  def new
    @entrant = Entrant.new
  end

  # GET /entrants/1/edit
  def edit
  end

  # POST /entrants or /entrants.json
  def create
    @entrant = Entrant.new(entrant_params)

    respond_to do |format|
      if @entrant.save
        format.html { redirect_to entrant_url(@entrant), notice: "Entrant was successfully created." }
        format.json { render :show, status: :created, location: @entrant }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @entrant.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /entrants/1 or /entrants/1.json
  def update
    respond_to do |format|
      if @entrant.update(entrant_params)
        format.html { redirect_to entrant_url(@entrant), notice: "Entrant was successfully updated." }
        format.json { render :show, status: :ok, location: @entrant }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @entrant.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /entrants/1 or /entrants/1.json
  def destroy
    @entrant.destroy

    respond_to do |format|
      format.html { redirect_to entrants_url, notice: "Entrant was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_entrant
      @entrant = Entrant.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def entrant_params
      params.require(:entrant).permit(:tournament_id, :userid, :name, :player_number, :rating, :division)
    end
end
