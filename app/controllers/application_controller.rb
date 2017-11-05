class ApplicationController < ActionController::API
  include DeviseTokenAuth::Concerns::SetUserByToken
  before_action :configure_permitted_parameters, if: :devise_controller?

  respond_to :json

  protected
    def configure_permitted_parameters
        devise_parameter_sanitizer.permit(:sign_up, keys: [:last_name, :type, :age, :name, :image])
    end

    def authorize_only_to_teachers
        if current_person.type != "Teacher"
            @needed_user = "teacher"
            render "errors/authorized", :status => 403
        end 
    end

    def authorize_only_to_students
        if current_person.type != "Student"
            @needed_user = "student"
            render "errors/authorized", :status => 403
        end 
    end

end
