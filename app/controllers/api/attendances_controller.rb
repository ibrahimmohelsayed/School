module Api
class AttendancesController < ApplicationController
    before_action :set_attendance, only: [:show, :edit, :update, :destroy]
  
    
    def index
      attendances = Attendance.all
      render json: {status: 'SUCCESS' , message: 'Loaded' , data:attendances} , status: :ok

    end
  

    def show
    end
  
    def new
      @attendance = Attendance.new
    end
  
    def edit
    end
  
    def create
      attendance = Attendance.new(attendance_params)
  
      if attendance.save
        render json: {status: 'SUCCESS', message:'Saved attendance', data:attendance},status: :ok
      else
        render json: {status: 'ERROR', message:'attendance not saved', data:attendance.errors},status: :unprocessable_entity
      end

    end
  

    def update
        attendance = Attendance.find(params[:id])
        if attendance.update_attributes(attendance_params)
          render json: {status: 'SUCCESS', message:'Updated attendance', data:attendance},status: :ok
        else
          render json: {status: 'ERROR', message:'attendance not updated', data:attendance.errors},status: :unprocessable_entity
        end

    end
  
    # DELETE /attendances/1
    # DELETE /attendances/1.json
    def destroy
        attendance = Attendance.find(params[:id])
        attendance.destroy
        render json: {status: 'SUCCESS', message:'Deleted attendance', data:attendance},status: :ok

      end
    end
  
    private
      # Use callbacks to share common setup or constraints between actions.
      def set_attendance
        @attendance = Attendance.find(params[:id])
      end
  
      # Never trust parameters from the scary internet, only allow the white list through.
      def attendance_params
        params.require(:attendance).permit(:student_id, :start_date, :end_date, :status, :remark)
      end
  
end 
  