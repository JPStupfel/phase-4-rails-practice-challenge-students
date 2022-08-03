class StudentsController < ApplicationController
    rescue_from ActiveRecord::RecordNotFound, with: :record_not_found

    rescue_from ActiveRecord::RecordInvalid, with: :record_not_valid
    def index 
        render json: Student.all
    end

    def destroy
        student = Student.find_by! id: params['id']
        student.destroy
        render json: student
    end

    def create
        student = Student.create! student_params
        render json: student
    end

    def update
        student = Student.find_by! id: params['id']
        student.update student_params
        render json: student

    end

    private
    def student_params
        params.permit :name, :age, :major, :instructor_id
    end
    def record_not_found
        render plain: "404 Not Found", status: 404
      end
      def record_not_valid
          render plain: "Instructors need names", status: 422
        end

end
