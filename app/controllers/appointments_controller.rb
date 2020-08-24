class AppointmentsController < ApplicationController
  before_action :authenticate_user!
  before_action :instantiate, except: [:index, :new, :create]
  
  def index
    @appointments = Appointment.all
  end

  def show
  end

  def new
    @appointment = Appointment.new
    @doctors = Doctor.all
  end

  def create
    @appointment = Appointment.new appointment_params
    if @appointment.save
      flash[:success] = 'Consulta cadastrada com sucesso.'
      redirect_to appointments_path
    else
      flash[:error] = @appointment.errors.full_messages
      redirect_to new_appointment_path
    end
  end

  def edit
  end

  def update
    if @appointment.update appointment_params
      flash[:success] = 'Consulta editada com sucesso.'
      redirect_to appointment_path(@appointment)
    else
      flash[:error] = @appointment.errors.full_messages
      render :edit
    end
  end

  def destroy
    if @appointment.destroy
      flash[:success] = 'Consulta removida com sucesso.'
      redirect_to appointments_path
    end
  end

  private

    def instantiate
      @appointment = Appointment.find params[:id]
    end

    def appointment_params
      params.require(:appointment).permit(:starts_at, :ends_at, :doctor_id, :patient_id)
    end
end
