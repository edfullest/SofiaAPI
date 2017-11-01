class PeopleController < ApplicationController
    before_action :authenticate_person!

    def profile
        render "people/success"
    end
end
