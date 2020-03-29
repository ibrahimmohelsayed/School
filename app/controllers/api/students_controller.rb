module Api
class StudentsController < ApplicationController
    before_action :set_student, only: [:show, :edit, :update, :destroy]
  
    # GET api/students
    def index
      students = Student.all
      render json: {status: 'SUCCESS', message:'Loaded students', data:students},status: :ok

    end
  
    # GET /students/1
    def show
    end
  
    def new
      @student = Student.new
    end
  
    # GET /students/1/edit
    def edit
    end
  
    # POST api/students
    def create
      student = Student.new(student_params)
  
      if student.save
        render json: {status: 'SUCCESS', message:'Saved student', data:student},status: :ok
      else
        render json: {status: 'ERROR', message:'student not saved', data:student.errors},status: :unprocessable_entity
      end
    end
  
    # PATCH/PUT api/students/1
    def update
        student = Student.find(params[:id])
        if student.update_attributes(student_params)
          render json: {status: 'SUCCESS', message:'Updated student', data:student},status: :ok
        else
          render json: {status: 'ERROR', message:'student not updated', data:student.errors},status: :unprocessable_entity
        end
    end
  
    # DELETE api/students/1
    def destroy
        student = Student.find(params[:id])
        student.destroy
        render json: {status: 'SUCCESS', message:'Deleted student', data:student},status: :ok

    end
  
    private
      # Use callbacks to share common setup or constraints between actions.
      def set_student
        @student = Student.find(params[:id])
      end
  
      # Never trust parameters from the scary internet, only allow the white list through.
      def student_params
        params.require(:student).permit(:name, :email, :password, :gender, :dob, :phone, :address, :lat, :long, :image, :image_cache, :parent_id)
      end
  end
end
  