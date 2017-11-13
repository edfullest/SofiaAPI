class StudentsController < ApplicationController
  before_action :set_student, only: [:show, :update, :destroy]
  before_action :authenticate_person!, :authorize_only_to_students, only: [:courses, :register_course, :unregister_course]
  
  def courses
    student = current_person
    @courses = student.courses
    render "courses/index"
  end

  # GET /students
  # GET /students.json
  def index
    @students = Student.all
  end

  def register_course
    student = current_person
    course_registration = CoursesPeople.new
    course_registration.person_id = student.id
    course_registration.course_id = params[:course_id]
    @course = course_registration.course
    if course_registration.save
      render "courses/show"
    else
      render json: course_registration.errors, status: :unprocessable_entity
    end
  end

  def unregister_course
    student = current_person
    course_registration = CoursesPeople.where(:course_id => params[:course_id])
                                       .where(:person_id => student.id)
    course_registration.destroy_all
  end

  # GET /students/1
  # GET /students/1.json
  def show
  end

  # POST /students
  # POST /students.json
  def create
    @student = Student.new(student_params)

    if @student.save
      render :show, status: :created, location: @student
    else
      render json: @student.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /students/1
  # PATCH/PUT /students/1.json
  def update
    if @student.update(student_params)
      render :show, status: :ok, location: @student
    else
      render json: @student.errors, status: :unprocessable_entity
    end
  end

  # DELETE /students/1
  # DELETE /students/1.json
  def destroy
    @student.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_student
      @student = Student.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def student_params
      params.fetch(:student, {})
      params.permit(:course_id)
    end
end
