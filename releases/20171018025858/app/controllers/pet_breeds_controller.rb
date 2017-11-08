class PetBreedsController < ApplicationController
  before_action :set_pet_breed, only: [:show, :edit, :update, :destroy]

  # GET /pet_breeds
  # GET /pet_breeds.json
  def index
    @pet_breeds = PetBreed.all
  end

  # GET /pet_breeds/1
  # GET /pet_breeds/1.json
  def show
  end

  # GET /pet_breeds/new
  def new
    @pet_breed = PetBreed.new
  end

  # GET /pet_breeds/1/edit
  def edit
  end

  # POST /pet_breeds
  # POST /pet_breeds.json
  def create
    @pet_breed = PetBreed.new(pet_breed_params)

    respond_to do |format|
      if @pet_breed.save
        format.html { redirect_to @pet_breed, notice: 'Pet breed was successfully created.' }
        format.json { render :show, status: :created, location: @pet_breed }
      else
        format.html { render :new }
        format.json { render json: @pet_breed.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /pet_breeds/1
  # PATCH/PUT /pet_breeds/1.json
  def update
    respond_to do |format|
      if @pet_breed.update(pet_breed_params)
        format.html { redirect_to @pet_breed, notice: 'Pet breed was successfully updated.' }
        format.json { render :show, status: :ok, location: @pet_breed }
      else
        format.html { render :edit }
        format.json { render json: @pet_breed.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pet_breeds/1
  # DELETE /pet_breeds/1.json
  def destroy
    @pet_breed.destroy
    respond_to do |format|
      format.html { redirect_to pet_breeds_url, notice: 'Pet breed was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pet_breed
      @pet_breed = PetBreed.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def pet_breed_params
      params[:pet_breed]
    end
end
