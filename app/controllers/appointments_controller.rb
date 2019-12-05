class AppointmentsController < ApplicationController
  before_action :set_doctor
  before_action :set_appointment, only: [ :show, :edit, :update, :destroy ]

  
  def index
    @appointments = @doctor.appointments
  end
   
  def show
  end

  def new
    @doctors = doctor.all - @doctor.doctor
    @appointment = @doctor.appointments.new
  end

  def create
    @appointment = @doctor.appointments.new(appointment_params)
    if @appointment.save
      redirect_to doctor_appointments_path(@doctor)
    else
      render :new
    end
  end
  def update
    if @appointment.update(appointment_params)
      redirect_to doctor_appointments_path(@doctor)
    else
      render :edit
    end
  end
  def destroy
    @appointment.destroy
    redirect_to doctor_appointments_path(@doctor)
  end
  def edit
  end
  private
    def appointment_params
      params.require(:appointment).permit(:time, :date)
    end

    def set_doctor
      # binding.pry
      @doctor = Doctor.find(params[:doctor_id])
    end

    def set_appointment
      @appointment = @doctor.appointments.find(params[:id])