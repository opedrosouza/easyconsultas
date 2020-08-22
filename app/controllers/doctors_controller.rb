class DoctorsController < ApplicationController
  before_action :authenticate_user!
  before_action :instantiate, except: [:index, :new, :create]
  
  def index
    @doctors = Doctor.all
  end

  def show
  end

  def new
    @doctor = Doctor.new
  end

  def create
    @doctor = Doctor.new doctor_params
    if @doctor.save
      flash[:success] = 'Médico cadastrado com sucesso.'
      redirect_to doctors_path
    else
      flash[:error] = 'Algo deu errado, tente novamente.'
      render :new
    end
  end

  def edit
  end

  def update
    if @doctor.update doctor_params
      flash[:success] = 'Médico atualizado com sucesso.'
      redirect_to doctors_path(@doctor)
    else
      flash[:error] = 'Algo deu errado, tente novamente.'
      render :edit
    end
  end

  def destroy
    if @doctor.destroy
      flash[:success] = 'Médico removido com sucesso.'
      redirect_to doctors_path
    end
  end

  private
    def instantiate
      @doctor = Doctor.find params[:id]
    end

    def doctor_params
      params.require(:doctor).permit(:name, :crm, :crm_uf)
    end
end
