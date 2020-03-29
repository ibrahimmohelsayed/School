module Api
class ClassroomsController < ApplicationController
    before_action :set_classroom, only: [:show, :edit, :update, :destroy]
  
    def index
      classrooms = Classroom.all
      render json: {status: 'SUCCESS' , message: 'Loaded' , data:classrooms} , status: :ok
    end
  
    def show
    end
  
    def new
      @classroom = Classroom.new
    end
  
    def edit
    end
  
  
    def create
        classroom = Classroom.new(classrooms_params)
  
        if classroom.save
          render json: {status: 'SUCCESS', message:'Saved classrooms', data:classroom},status: :ok
        else
          render json: {status: 'ERROR', message:'classrooms not saved', data:classroom.errors},status: :unprocessable_entity
        end
    end
  
    def update
        classroom = Classroom.find(params[:id])
        if classroom.update_attributes(classrooms_params)
          render json: {status: 'SUCCESS', message:'Updated classrooms', data:classroom},status: :ok
        else
          render json: {status: 'ERROR', message:'classrooms not updated', data:classroom.errors},status: :unprocessable_entity
        end
    end
  
    def destroy
        classroom = Classroom.find(params[:id])
        classroom.destroy
        render json: {status: 'SUCCESS', message:'Deleted classrooms', data:classroom},status: :ok
    end
  
    private
      # Use callbacks to share common setup or constraints between actions.
      def set_classroom
        @classroom = Classroom.find(params[:id])
      end
  
      # Never trust parameters from the scary internet, only allow the white list through.
      def classroom_params
        params.require(:classroom).permit(:name, :year, :grade_id, :section, :status, :remarks, :teacher_id)
      end
  end
end
  