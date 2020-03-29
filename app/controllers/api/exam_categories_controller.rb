module Api
class ExamCategoriesController < ApplicationController
    before_action :set_exam_category, only: [:show, :edit, :update, :destroy]
  
    # GET api/exam_categories
    def index
      exam_categories = ExamCategory.all
      render json: {status: 'SUCCESS', message:'Loaded exam_categorys', data:exam_categories},status: :ok

    end
  
    # GET /exam_categories/1
    # GET /exam_categories/1.json
    def show
    end
  
    # GET /exam_categories/new
    def new
      @exam_category = ExamCategory.new
    end
  
    # GET /exam_categories/1/edit
    def edit
    end
  
    # POST api/exam_categories
    def create
      exam_category = ExamCategory.new(exam_category_params)
  
      if exam_category.save
        render json: {status: 'SUCCESS', message:'Saved exam_category', data:exam_category},status: :ok
      else
        render json: {status: 'ERROR', message:'exam_category not saved', data:exam_category.errors},status: :unprocessable_entity
      end
  end
  
    # PATCH/PUT api/exam_categories/1
    def update
        exam_category = ExamCategory.find(params[:id])
        if exam_category.update_attributes(exam_category_params)
          render json: {status: 'SUCCESS', message:'Updated exam_category', data:exam_category},status: :ok
        else
          render json: {status: 'ERROR', message:'exam_category not updated', data:exam_category.errors},status: :unprocessable_entity
        end

    end
  
    # DELETE api/exam_categories/1
    def destroy
        exam_category = ExamCategory.find(params[:id])
        exam_category.destroy
        render json: {status: 'SUCCESS', message:'Deleted exam_category', data:exam_category},status: :ok
    end
  
    private
      # Use callbacks to share common setup or constraints between actions.
      def set_exam_category
        @exam_category = ExamCategory.find(params[:id])
      end
  
      # Never trust parameters from the scary internet, only allow the white list through.
      def exam_category_params
        params.require(:exam_category).permit(:name, :description)
      end
  end
end