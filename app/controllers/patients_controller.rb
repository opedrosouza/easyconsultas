class PatientsController < ApplicationController
  before_action :authenticate_user!
  before_action :instantiate, except: [:index, :new, :create]
  
  def index
    @patients = Patient.all
  end

  def show
  end

  def new
    @patient = Patient.new
    @doctors = Doctor.all
  end

  def create
    @patient = Patient.new patient_params
    cpf_normalizer @patient
    if @patient.save
      flash[:success] = 'Paciente cadastrado com sucesso.'
      redirect_to patients_path
    else
      flash[:error] = @patient.errors.full_messages
      render :new
    end
  end

  def edit
  end

  def update
    cpf_normalizer @patient
    if @patient.update patient_params
      flash[:success] = 'Paciente atualizado com sucesso.'
      redirect_to patient_path(@patient)
    else
      flash[:error] = @patient.errors.full_messages
      render :edit
    end
  end

  def destroy
    if @patient.destroy
      flash[:success] = 'Paciente removido com sucesso.'
      redirect_to patients_path      
    end
  end

  private

    def instantiate
      @patient = Patient.find params[:id]
    end

    def patient_params
      params.require(:patient).permit(:name, :birth_date, :cpf, :doctor_id)
    end

    def cpf_normalizer patient
      patient.cpf = patient.cpf.gsub('.', '').gsub('-', '')
    end
end
