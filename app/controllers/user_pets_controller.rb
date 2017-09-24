class UserPetsController < ApplicationController

  def create
    @user_pet = UserPet.new(user_pet_params)
    @user_pet.save
    @pet = Pet.find(user_pet_params["pet_id"])
    respond_to do |f|
      f.js { render 'create'}
    end
  end

  def destroy
    @user_pet = UserPet.find(params[:id])
    @user_pet.destroy
    @pet = Pet.find(params["user_pet"]["pet_id"])
    respond_to do |f|
      f.js { render 'destroy' }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user_pet
      @user_pet = UserPet.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_pet_params
      # params[:user_pet]
      params.require(:user_pet).permit(:user_id, :pet_id)
    end
end
