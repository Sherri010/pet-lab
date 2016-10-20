class PetsController < ApplicationController

  def index
     @pets = Pet.all
  end

  def show
     @pet = Pet.find_by_id(params[:id])
  end

  def new
    @pet = Pet.new
  end

  def create
    pet = Pet.create(pet_params)
   if  pet.save
      redirect_to @pet
   else
     flash[:error] = pet.error.full_message.join(" ")
     render :new
   end
  end

  private
  def pet_params
    params.require(:pet).permit(:name, :breed, :date_of_birth)
  end

end
