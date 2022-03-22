class EntrantsController < ApplicationController
  before_action :set_entrant, only: %i[ show edit update destroy ]
  before_action :get_tournament

  # GET /entrants or /entrants.json
  def index
    @entrants = json_entrants(@tournament).to_json
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

  def update_all
    tid = params["tournament_id"]
    Entrant.destroy_by(tournament_id: tid)
    new = params["_json"].filter {|e|
      !e["name"].empty?
    }.map {|e|
      e.merge({"tournament_id": tid}).permit(:tournament_id, :userid, :name, :player_number, :rating, :division)
    }
    if new.length > 0
      Entrant.insert_all(new)
    end
    respond_to do |format|
      format.json {
        entrants = json_entrants(@tournament)
        render json: entrants
      }
    end
  end

  private
    def get_tournament
      @tournament = Tournament.find(params[:tournament_id])
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_entrant
      @entrant = Entrant.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def entrant_params
      params.require(:entrant).permit(:tournament_id, :userid, :name, :player_number, :rating, :division)
    end

    def json_entrants(tournament)
      keys = ["division", "player_number", "userid", "name", "rating"]
      tournament.entrants.map {|e|
        e.as_json.slice(*keys).update("deleted": false)
      }
    end
end
