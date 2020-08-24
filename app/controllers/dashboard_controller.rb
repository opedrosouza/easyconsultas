class DashboardController < ApplicationController
  before_action :authenticate_user!
  
  def index
    @doctors = params[:doctor_name] ? @doctors = Doctor.with_name(params[:doctor_name]).paginate({page: params[:page] || 1, per_page: 10}) : Doctor.all.paginate({page: params[:page] || 1, per_page: 10})

    @patients_count     = Patient.all.count
    @appointments_count = Appointment.all.count
  end

  def search
    unless params[:doctor_name].empty?
      @doctors = Doctor.with_name(search_params[:doctor_name]).paginate({page: params[:page] || 1, per_page: 10})
    else
      @doctors = Doctor.all.paginate({page: params[:page] || 1, per_page: 10})
    end
    @patients_count     = Patient.all.count
    @appointments_count = Appointment.all.count
    render :index
  end

  private
    def search_params
      params.permit(:doctor_name)
    end
    
end
