class Api::V1::ScoreboardsController < ApplicationController
  before_action :set_scoreboard, only: [:show, :update, :destroy]

  # GET /scoreboards
  def index
    @scoreboards = Scoreboard.all

    render json: @scoreboards
  end

  # GET /scoreboards/1
  def show
    render json: @scoreboard.to_json(include: [:matches])
  end

  # POST /scoreboards
  def create
    @scoreboard = Scoreboard.new(scoreboard_params)

    if @scoreboard.save
      render json: @scoreboard, status: :created, location: @scoreboard
    else
      render json: @scoreboard.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /scoreboards/1
  def update
    if @scoreboard.update(scoreboard_params)
      render json: @scoreboard
    else
      render json: @scoreboard.errors, status: :unprocessable_entity
    end
  end

  def get_or_update_api
    if Api.change_dates
      Api.change_dates
      Api.pull_matchday_data
      @scoreboard = Scoreboard.find_by(end_date: Api.get_end_date())
      render json: @scoreboard.to_json(include: [:matches])
    else
      Api.update_current_matches
      @scoreboard = Scoreboard.find_by(end_date: Api.get_end_date())
      render json: @scoreboard.to_json(include: [:matches])
    end
  end

  # DELETE /scoreboards/1
  def destroy
    @scoreboard.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_scoreboard
      @scoreboard = Scoreboard.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def scoreboard_params
      params.fetch(:scoreboard, {})
    end
end
