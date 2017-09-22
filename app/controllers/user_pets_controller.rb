class UserPetsController < ApplicationController

  def create
    @user_pet = UserPet.new(user_pet_params)

    respond_to do |format|
      if @user_pet.save
        format.html { redirect_to my_pets_path, notice: 'Pet breed was successfully created.' }
        format.json { render :my_pets, status: :created }
      else
        format.html { render :new }
        format.json { render json: @user_pet.errors, status: :unprocessable_entity }
      end
    end
  end  

  def destroy
    @user_pet = UserPet.find(params[:id])
    @user_pet.destroy
    redirect_to :back
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
