class ExamsController < ApplicationController
    before_action :set_exam, only: [:show, :edit, :update, :destroy]
  
    # GET api/exams
    def index
      exams = Exam.all
      render json: {status: 'SUCCESS', message:'Loaded exams', data:exams},status: :ok

    end
  
    # GET /exams/1
    def show
    end
  
    # GET /exams/new
    def new
      @exam = Exam.new
    end
  
    # GET /exams/1/edit
    def edit
    end
  
    # POST api/exams
    def create
      exam = Exam.new(exam_params)
  
      if exam.save
        render json: {status: 'SUCCESS', message:'Saved exam', data:exam},status: :ok
      else
        render json: {status: 'ERROR', message:'exam not saved', data:exam.errors},status: :unprocessable_entity
      end
    end
  
    # PATCH/PUT api/exams/1
    def update
        exam = Exam.find(params[:id])
        if exam.update_attributes(exam_params)
          render json: {status: 'SUCCESS', message:'Updated exam', data:exam},status: :ok
        else
          render json: {status: 'ERROR', message:'exam not updated', data:exam.errors},status: :unprocessable_entity
        end

    end
  
    # DELETE api/exams/1
    def destroy
        exam = Exam.find(params[:id])
        exam.destroy
        render json: {status: 'SUCCESS', message:'Deleted exam', data:exam},status: :ok
    end
  
    private
      # Use callbacks to share common setup or constraints between actions.
      def set_exam
        @exam = Exam.find(params[:id])
      end
  
      # Never trust parameters from the scary internet, only allow the white list through.
      def exam_params
        params.require(:exam).permit(:exam_category_id, :name, :start_date)
      end
  end
  