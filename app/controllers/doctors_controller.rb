class DoctorsController < ApplicationController
  before_action :set_doctor, only: [:show, :edit, :update, :destroy]
  def index
    @doctors = Doctor.all
    
  end

  def show
  end

  def new
    @doctor = Doctor.new
  end

  def edit
  end

  def create
    @doctor = Doctor.new(doctor_params)
    if @doctor.save
      redirect_to doctor_path(@doctor)
    else render :new
    end
  end

  def update
    if doctor.update(doctor_params)
      redirect_to doctor_path
    else
      render :edit
     
   end
  end
  
  def destroy
    @doctor.destroy
  end



  private
    def doctor_params
      params.require(:doctor).permit(:name, :specialty)
    end
   def set_doctor
    @doctor = current_user.accounts.find(params[:id])
   end
end