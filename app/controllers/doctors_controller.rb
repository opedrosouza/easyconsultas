class DoctorsController < ApplicationController
  before_action :authenticate_user!
  before_action :instantiate, except: [:index, :new, :create]
  
  def index
    @doctors = Doctor.all
    respond_to do |format|
      format.json
      format.html {  }
    end
  end

  def show
  end

  def new
    @doctor = Doctor.new
  end

  def create
    @doctor = Doctor.new doctor_params
    set_crm

    if @doctor.save
      flash[:success] = 'Médico cadastrado com sucesso.'
      redirect_to doctors_path
    else
      flash[:error] = @doctor.errors.full_messages
      render :new
    end
  end

  def edit
  end

  def update
    set_crm

    if @doctor.update doctor_params
      flash[:success] = 'Médico atualizado com sucesso.'
      redirect_to doctors_path(@doctor)
    else
      flash[:error] = @doctor.errors.full_messages[1]
      render :edit
    end
  end

  def destroy
    if @doctor.patients.count === 0
      if @doctor.destroy
        flash[:success] = 'Médico removido com sucesso.'
        redirect_to doctors_path
      end
    else
      flash[:error] = 'Não é possível excluir médico com pacientes.'
      redirect_to doctors_path
    end
  end

  private
    def instantiate
      @doctor = Doctor.find params[:id]
    end

    def set_crm
      @doctor.crm_full = "#{@doctor.crm}-#{@doctor.crm_uf.upcase}"
    end

    def doctor_params
      params.require(:doctor).permit(:name, :crm, :crm_uf)
    end
end
