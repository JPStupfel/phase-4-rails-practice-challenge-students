class InstructorsController < ApplicationController

    rescue_from ActiveRecord::RecordNotFound, with: :record_not_found

    rescue_from ActiveRecord::RecordInvalid, with: :record_not_valid

    def index
        render json: Instructor.all
    end

    def destroy
        instructor = Instructor.find_by! id:params['id']
        instructor.destroy
        render json: instructor
    end

    def create
        instructor = Instructor.create! instructor_params

        render json: instructor
    end

    def update
        instructor = Instructor.find_by! id: params['id']
        instructor.update instructor_params
        render json: instructor

    end

    private

    def instructor_params
        params.permit :name
    end

    def record_not_found
      render plain: "404 Not Found", status: 404
    end
    def record_not_valid
        render plain: "Instructors need names", status: 422
      end



end
