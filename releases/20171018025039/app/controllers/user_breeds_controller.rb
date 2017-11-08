class UserBreedsController < ApplicationController
  before_action :set_user_breed, only: [:show, :edit, :update, :destroy]

  # GET /user_breeds/new
  # def new
  #   @user_breed = UserBreed.new
  # end

  # POST /user_breeds
  # POST /user_breeds.json
  def create
    @user_breed = UserBreed.new(user_breed_params)

    respond_to do |format|
      if @user_breed.save
        format.html { redirect_to @user_breed, notice: 'User breed was successfully created.' } # this should reload page
        format.json { render :show, status: :created, location: @user_breed }
      else
        format.html { render :new }
        format.json { render json: @user_breed.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /user_breeds/1
  # DELETE /user_breeds/1.json
  def destroy
    @user_breed.destroy
    respond_to do |format|
      format.html { redirect_to user_breeds_url, notice: 'User breed was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user_breed
      @user_breed = UserBreed.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_breed_params
      params.require(:user_breed).permit(:user_id, :breed_id)
    end
end
