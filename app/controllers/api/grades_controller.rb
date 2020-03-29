module Api
class GradesController < ApplicationController
    before_action :set_grade, only: [:show, :edit, :update, :destroy]
  
    # GET api/grades
    def index
      grades = Grade.all
      render json: {status: 'SUCCESS', message:'Loaded grades', data:grades},status: :ok

    end
  
    # GET /grades/1
    # GET /grades/1.json
    def show
    end
  
    # GET /grades/new
    def new
      @grade = Grade.new
    end
  
    # GET /grades/1/edit
    def edit
    end
  
    # POST api/grades
    def create
      grade = Grade.new(grade_params)
      if grade.save
        render json: {status: 'SUCCESS', message:'Saved grade', data:grade},status: :ok
      else
        render json: {status: 'ERROR', message:'grade not saved', data:grade.errors},status: :unprocessable_entity
      end

     
    end
  
    # PATCH/PUT /grades/1
    # PATCH/PUT /grades/1.json
    def update
        grade = Grade.find(params[:id])
        if grade.update_attributes(grade_params)
          render json: {status: 'SUCCESS', message:'Updated grade', data:grade},status: :ok
        else
          render json: {status: 'ERROR', message:'grade not updated', data:grade.errors},status: :unprocessable_entity
        end
    end
  
    # DELETE /grades/1
    # DELETE /grades/1.json
    def destroy
        grade = Grade.find(params[:id])
        grade.destroy
        render json: {status: 'SUCCESS', message:'Deleted grade', data:grade},status: :ok

      end
    end
  
    private
      # Use callbacks to share common setup or constraints between actions.
      def set_grade
        @grade = Grade.find(params[:id])
      end
  
      # Never trust parameters from the scary internet, only allow the white list through.
      def grade_params
        params.require(:grade).permit(:name, :description)
      end
  end
end