class UserPetsController < ApplicationController

  def create
    @user_pet = UserPet.new(user_pet_params)

    respond_to do |format|
      if @user_pet.save
        format.html { redirect_to @user_pet, notice: 'Pet breed was successfully created.' }
        format.json { render :show, status: :created, location: @user_pet }
      else
        format.html { render :new }
        format.json { render json: @user_pet.errors, status: :unprocessable_entity }
      end
    end
  end  

  def show
    @pets = []
    my_user_pets = UserPet.where(:user_id => current_user.id).select('pet_id')
    my_user_pets.each do |up|
      @pets.push Pet.find(up.pet_id)
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
