class ResultsController < ApplicationController
  before_action :set_result, only: %i[ show edit update destroy ]
  before_action :get_tournament

  # GET /results or /results.json
  def index
    @results = json_results(@tournament).to_json
  end

  # GET /results/1 or /results/1.json
  def show
  end

  # GET /results/new
  def new
    @result = @tournament.results.build
  end

  # GET /results/1/edit
  def edit
  end

  # POST /results or /results.json
  def create
    @result = @tournament.results.build(result_params)

    respond_to do |format|
      if @result.save
        format.html { redirect_to new_tournament_result_path(@tournament), notice: "Result was successfully created." }
        format.json { render :show, status: :created, location: @result }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @result.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /results/1 or /results/1.json
  def update
    respond_to do |format|
      if @result.update(result_params)
        format.html { redirect_to tournament_result_path(@tournament), notice: "Result was successfully updated." }
        format.json { render :show, status: :ok, location: @result }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @result.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /results/1 or /results/1.json
  def destroy
    @result.destroy

    respond_to do |format|
      format.html { redirect_to results_url, notice: "Result was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def update_all
    tid = params["tournament_id"]
    Result.destroy_by(tournament_id: tid)
    new = params["_json"].filter {|e|
      !e["player1"].empty?
    }.map {|e| from_row(e)}
    if new.length > 0
      Result.insert_all(new)
    end
    respond_to do |format|
      format.json {
        results = json_results(@tournament)
        render json: results
      }
    end
  end

  private
    def get_tournament
      @tournament = Tournament.find(params[:tournament_id])
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_result
      @result = @tournament.results.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def result_params
      params.require(:result).permit(:tournament_id, :division, :round, :entrant_id, :opponent_id, :score, :opponent_score, :first)
    end
    
    def from_row(e)
      keys = ["division", "round", "entrant_id", "opponent_id"]
      e.slice(*keys).merge({
        tournament_id: @tournament.id,
        score: e['score1'],
        opponent_score: e['score2'],
        first: e['first'] == 1
      })
    end

    def to_row(e)
     {
        "division" => e.division,
        "round" => e.round,
        "entrant_id" => e.entrant.id,
        "player1" => e.entrant.name,
        "score1" => e.score,
        "opponent_id" => e.opponent.id,
        "player2" => e.opponent.name,
        "score2" => e.opponent_score,
        "first" => e.first ? 1 : 2,
        "deleted" => false
      }
    end
 
    def json_results(tournament)
      tournament.results.map {|e| to_row(e)}
    end
end
