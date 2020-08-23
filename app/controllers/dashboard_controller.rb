class DashboardController < ApplicationController
  before_action :authenticate_user!
  
  def index
    @doctors = params[:doctor_name] ? @doctors = Doctor.with_name(params[:doctor_name]) : Doctor.all

    @patients_count     = Patient.all.count
    @appointments_count = Appointment.all.count
  end

  def search
    if params[:doctor_name]
      @doctors = Doctor.with_name(params[:doctor_name])
    end
    render :index
  end
end
