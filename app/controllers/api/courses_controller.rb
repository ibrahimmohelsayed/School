module Api
class CoursesController < ApplicationController
    before_action :set_course, only: [:show, :edit, :update, :destroy]
  
    
    def index
      courses = Course.all
      render json: {status: 'SUCCESS', message:'Loaded courses', data:courses},status: :ok
    end
  
    def show
    end
  
    def new
      @course = Course.new
    end
  
    def edit
    end
  
    
    def create
        course = Course.new(course_params)

        if course.save
          render json: {status: 'SUCCESS', message:'Saved course', data:course},status: :ok
        else
          render json: {status: 'ERROR', message:'course not saved', data:course.errors},status: :unprocessable_entity
        end

    end
  
    # PATCH/PUT api/courses/1
    # PATCH/PUT api/courses/1.json
    def update
        course = Course.find(params[:id])
        if course.update_attributes(course_params)
          render json: {status: 'SUCCESS', message:'Updated course', data:course},status: :ok
        else
          render json: {status: 'ERROR', message:'course not updated', data:course.errors},status: :unprocessable_entity
        end
    end
  
    # DELETE api/courses/1
    # DELETE api/courses/1.json
    def destroy
        course = Course.find(params[:id])
        course.destroy
        render json: {status: 'SUCCESS', message:'Deleted course', data:course},status: :ok

    end
  
    private
      # Use callbacks to share common setup or constraints between actions.
      def set_course
        @course = Course.find(params[:id])
      end
  
      # Never trust parameters from the scary internet, only allow the white list through.
      def course_params
        params.require(:course).permit(:name, :description, :grade_id)
      end
  end
end
  