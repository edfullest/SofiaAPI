class SessionsController < DeviseTokenAuth::SessionsController
    # This method gets called every time there is a successful login
    def render_create_success
        render "people/success"
    end
end
