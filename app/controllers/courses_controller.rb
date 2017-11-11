class CoursesController < ApplicationController
  before_action :set_course, only: [:show, :update, :destroy]
  before_action :authenticate_person!, :authorize_only_to_teachers, only: [:show, :create, :update, :destroy]
  
  # GET /courses
  # GET /courses.json
  def index
    @courses = Course.all
  end

  # GET /courses/1
  # GET /courses/1.json
  def show
    if current_person.type == 'Teacher'
      
      redirect_to teachers_load_course_url(course_id: params[:id])
    else
      redirect_to :controller => 'controllername', :action => 'actionname' 
    end
    
  end

  # POST /courses
  # POST /courses.json
  def create
    puts params[:start_date]
    @course = Course.new
    @course.start_date = params[:start_date]
    @course.end_date = params[:end_date]
    @course.name = params[:name]
    @course.teacher = current_person

    if @course.save
      render :show, status: :created, location: @course
    else
      render json: @course.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /courses/1
  # PATCH/PUT /courses/1.json
  def update
    if @course.update(course_params)
      render :show, status: :ok, location: @course
    else
      render json: @course.errors, status: :unprocessable_entity
    end
  end

  # DELETE /courses/1
  # DELETE /courses/1.json
  def destroy
    @course.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_course
      @course = Course.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def course_params
      params.require(:course).permit(:name, :start_date, :end_date, :rating)
    end
end
