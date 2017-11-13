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
    # puts params
    questions =  JSON.parse(params[:questions])
    q_hash = questions["questions"]
    @assignment = Assignment.new
    @assignment.course_id = params[:course_id]
    @assignment.type = "Homework"
    @assignment.start_date = params[:start_date]
    @assignment.end_date = params[:end_date]
    @assignment.name = params[:name]
    # Following is the question hash
    q_hash.each do |key, value|
      a_hash = key["answers"]
      question = key["question"]
      puts question
      new_question = Question.new
      new_question.description = question
      new_question.type = "MultipleChoice"
      # Answer hash
      a_hash.each do |k,v|
        puts k["is_correct"]
        puts k["description"]
        new_answer = Answer.new
        new_answer.description = k["description"]
        new_answer.is_correct = k["is_correct"]
        new_question.association(:answers).add_to_target(new_answer)
      end
      @assignment.association(:questions).add_to_target(new_question)
    end
   
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
      render :show, status: :ok
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
      params.require(:assignment).permit(:name, :start_date, :end_date, :rating, :type, :course_id, :questions => [])
    end
end
