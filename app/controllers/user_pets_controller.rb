class UserPetsController < ApplicationController
  before_action :set_user_pet, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  # GET /user_pets
  # GET /user_pets.json
  def index
    @user_pets = UserPet.all
  end

  # GET /user_pets/1
  # GET /user_pets/1.json
  def show
  end

  # GET /user_pets/new
  def new
    @user_pet = UserPet.new
  end

  # GET /user_pets/1/edit
  def edit
  end

  # POST /user_pets
  # POST /user_pets.json
  def create
    @user_pet = UserPet.new(user_pet_params)

    respond_to do |format|
      if @user_pet.save
        # don't redirect, notice that pet was favorited or update the heart icon on page.
        # format.html { redirect_to @user_pet, notice: 'User pet was successfully created.' }
        # format.json { render :show, status: :created, location: @user_pet }
      else
        # do nothing
        # format.html { render :new }
        # format.json { render json: @user_pet.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /user_pets/1
  # PATCH/PUT /user_pets/1.json
  def update
    respond_to do |format|
      if @user_pet.update(user_pet_params)
        format.html { redirect_to @user_pet, notice: 'User pet was successfully updated.' }
        format.json { render :show, status: :ok, location: @user_pet }
      else
        format.html { render :edit }
        format.json { render json: @user_pet.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /user_pets/1
  # DELETE /user_pets/1.json
  def destroy
    @user_pet.destroy
    respond_to do |format|
      format.html { redirect_to user_pets_url, notice: 'User pet was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user_pet
      @user_pet = UserPet.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_pet_params
      params[:user_pet]
    end
end
