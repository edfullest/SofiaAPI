class DoubtsController < ApplicationController
  before_action :set_doubt, only: [:show, :update, :destroy]
  before_action :authenticate_person!, :authorize_only_to_students, only: [:create, :destroy]


  # GET /doubts
  # GET /doubts.json
  def index
    @doubts = Doubt.all
  end

  # GET /doubts/1
  # GET /doubts/1.json
  def show
  end

  # POST /doubts
  # POST /doubts.json
  def create
    @doubt = Doubt.new(doubt_params)

    if @doubt.save
      render :show, status: :created, location: @doubt
    else
      render json: @doubt.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /doubts/1
  # PATCH/PUT /doubts/1.json
  def update
    if @doubt.update(doubt_params)
      render :show, status: :ok, location: @doubt
    else
      render json: @doubt.errors, status: :unprocessable_entity
    end
  end

  # DELETE /doubts/1
  # DELETE /doubts/1.json
  def destroy
    @doubt.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_doubt
      @doubt = Doubt.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def doubt_params
      params.require(:doubt).permit(:question, :answer, :assignment_id)
    end
  end
