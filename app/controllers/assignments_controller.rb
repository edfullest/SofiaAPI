class AssignmentsController < ApplicationController
  before_action :set_assignment, only: [:show, :update, :destroy]
  before_action :authenticate_person!, :authorize_only_to_teachers, only: [:create, :update, :destroy]
  # GET /assignments
  # GET /assignments.json
  def index
    @assignments = Assignment.all
  end

  # GET /assignments/1
  # GET /assignments/1.json
  def show
  end

  # POST /assignments
  # POST /assignments.json
  def create
    @assignment = Assignment.new(assignment_params)

    if @assignment.save
      render :show, status: :created, location: @assignment
    else
      render json: @assignment.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /assignments/1
  # PATCH/PUT /assignments/1.json
  def update
    if @assignment.update(assignment_params)
      render :show, status: :ok, location: @assignment
    else
      render json: @assignment.errors, status: :unprocessable_entity
    end
  end

  # DELETE /assignments/1
  # DELETE /assignments/1.json
  def destroy
    @assignment.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_assignment
      @assignment = Assignment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def assignment_params
      params.require(:assignment).permit(:name, :start_date, :end_date, :rating, :type, :course_id)
    end
end
