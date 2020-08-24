class DashboardController < ApplicationController
  before_action :authenticate_user!
  
  def index
    @doctors = params[:doctor_name] ? @doctors = Doctor.with_name(params[:doctor_name]).paginate({page: params[:page] || 1, per_page: 10}) : Doctor.all.paginate({page: params[:page] || 1, per_page: 10})
    # @appointments = @doctors.select { |doc| doc.appointments.do_periodo(params[:inicio_periodo], params[:fim_periodo]) }
    @patients_count     = Patient.all.count
    @appointments_count = Appointment.all.count

    respond_to do |format|
      format.html {  }
      format.js
    end
  end

  def search
    unless params[:doctor_name].empty?
      @doctors = Doctor.with_name(search_params[:doctor_name]).paginate({page: params[:page] || 1, per_page: 10})
      # @appointments = @doctors.select { |doc| doc.appointments.do_periodo(params[:inicio_periodo], params[:fim_periodo]) }
    else
      @doctors = Doctor.all.paginate({page: params[:page] || 1, per_page: 10})
    end
    @patients_count     = Patient.all.count
    @appointments_count = Appointment.all.count
    respond_to do |format|
      format.html {  }
      format.js
    end
  end

  def search_with parameters
    parameters.each do |parameter, value|
      if not value.empty?
        @doctors
      end
    end
  end

  private
    def search_params
      params.permit(:doctor_name, :inicio_periodo, :fim_periodo)
    end
    
end
