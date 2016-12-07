class LabsController < ApplicationController
  before_action :authenticate_user!#autenticador se coloca en el controlador que quieras restringir
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

    def destroy
      find_lab
      if @lab.destroy
        flash[:error] = "producto eliminado"
        redirect_to labs_path
      end
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
