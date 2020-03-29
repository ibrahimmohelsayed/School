
class ParentsController < ApplicationController
    before_action :set_parent, only: [:show, :edit, :update, :destroy]
  
    # GET /parents
    # GET /parents.json
    def index
      parents = Parent.all
      render json: {status: 'SUCCESS', message:'Loaded parents', data:parents},status: :ok

    end
  
    # GET /parents/1
    # GET /parents/1.json
    def show
    end
  
    # GET /parents/new
    def new
      @parent = Parent.new
    end
  
    # GET /parents/1/edit
    def edit
    end
  
    # POST /parents
    # POST /parents.json
    def create
      parent = Parent.new(parent_params)
  
      if parent.save
        render json: {status: 'SUCCESS', message:'Saved parent', data:parent},status: :ok
      else
        render json: {status: 'ERROR', message:'parent not saved', data:parent.errors},status: :unprocessable_entity
      end
    end
  
    # PATCH/PUT /parents/1
    # PATCH/PUT /parents/1.json
    def update
        parent = Parent.find(params[:id])
        if parent.update_attributes(parent_params)
          render json: {status: 'SUCCESS', message:'Updated parent', data:parent},status: :ok
        else
          render json: {status: 'ERROR', message:'parent not updated', data:parent.errors},status: :unprocessable_entity
        end

    end
  
    # DELETE /parents/1
    # DELETE /parents/1.json
    def destroy
        parent = Parent.find(params[:id])
        parent.destroy
        render json: {status: 'SUCCESS', message:'Deleted parent', data:parent},status: :ok

    end
  
    private
      # Use callbacks to share common setup or constraints between actions.
      def set_parent
        @parent = Parent.find(params[:id])
      end
  
      # Never trust parameters from the scary internet, only allow the white list through.
      def parent_params
        params.require(:parent).permit(:name, :email, :password, :gender, :dob, :phone, :address, :lat, :long, :image, :image_cache)
      end
  end