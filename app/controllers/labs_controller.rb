class LabsController < ApplicationController

    def index
      @labs = Lab.all
    end

    def new
      @lab = Lab.new
    end

    def edit
      find_lab
      if @lab.nil?
        flash[:error] = "No existe el producto"
        redirect_to root_path
      end
    end

    def create
      @lab = Lab.new(lab_params)
        if @lab.save
          redirect_to labs_path
        end
    end

    def delete
    end

    def show
      find_lab
      if @lab.nil?
        flash[:error] = "Houston we are in troubles, please dont hack us."
        redirect_to root_path
      end
    end


    def update
    end

    private

    def find_lab
      @lab = Lab.find_by(id: params[:id])
    end

    #strong parameters
    def lab_params
      params.require(:lab).permit(:nombre)
    end
end