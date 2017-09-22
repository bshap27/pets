class PetsController < ApplicationController

  # before_action :set_pet, only: [:show, :edit, :update, :destroy]
  
  def index
    @pets = Pet.where.not(:primary_photo => nil).order(created_at: :desc)
    @breeds = Breed.all
  end

  def show
  end

  def sophie
    sql = "SELECT id from pets LEFT OUTER JOIN (
          (SELECT pet_id, breed_id, excluded_breeds.hub_exclude from pet_breeds
          JOIN  
           (SELECT id, hub_exclude from breeds where hub_exclude IS NOT NULL) excluded_breeds
            ON pet_breeds.breed_id = excluded_breeds.id)) breeds_and_exclusions
          ON pets.id = breeds_and_exclusions.pet_id
          WHERE breeds_and_exclusions.hub_exclude IS NULL
          ORDER BY created_at DESC"
    # exclude_pets = Pet.joins(:breeds).where(breeds: { hub_exclude: true })
    # all_pets = Pet.where.not(pets: { primary_photo: nil }).order('created_at desc').limit(10)
    # @pets = all_pets.select { |pet| !exclude_pets.include? pet }
    result = execute_statement(sql)
    @pets = result.collect { |hash| Pet.find(hash["id"]) }
    @form_unhide = true
  end

  def results
    query = {}
    size = []
    if params["small"] != nil; size.push('S') end
    if params["medium"] != nil; size.push('M') end
    if params["large"] != nil; size.push('L') end
    if params["xlarge"] != nil; size.push('XL') end
    if size.length > 0; query[:size] = size end
    age = []
    if params["baby"] != nil; age.push('baby') end
    if params["young"] != nil; age.push('young') end
    if params["adult"] != nil; age.push('adult') end
    if params["senior"] != nil; age.push('senior') end
    if age.length > 0; query[:age] = age end
    if params["male"] == 1 && params["female"] != '1'
      query[:sex] = "M"
    elsif params["female"] == 1 && params["male"] != '1'
      query[:sex] = "F"
    end
    query[:zip] = DistanceApi.find_zips_in_radius(params["zip"], params["radius"])
    if !["Any", nil].include? params["breed"]
      breed = Breed.find(params["breed"])
    end
    breed_query = breed ? {:pet_breeds => {:breed_id => breed}} : {}
    @pets = Pet.joins(:pet_breeds).where(breed_query)
                      .where(query)
                      .where("pets.created_at >= ?", Time.now - params["created"].to_i.days).limit(10)
                      .where.not(:primary_photo => nil)
                      .order("pets.created_at desc")
    @soph_results = params["soph_breeds"]
  end

  # GET /posts/new
  def new
    @pet = Pet.new
  end

  # GET /posts/1/edit
  def edit
  end

  # POST /posts
  # POST /posts.json
  def create
    @pet = Pet.new(post_params)

    respond_to do |format|
      if @post.save
        format.html { redirect_to @pet, notice: 'Pet was successfully created.' }
        format.json { render :show, status: :created, location: @pet }
      else
        format.html { render :new }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @pet.update(post_params)
        format.html { redirect_to @pet, notice: 'Pet was successfully updated.' }
        format.json { render :show, status: :ok, location: @pet }
      else
        format.html { render :edit }
        format.json { render json: @pet.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    @pet.destroy
    respond_to do |format|
      format.html { redirect_to pets_url, notice: 'Pet was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pet
      @pet = Pet.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def pet_params
      params.require(:pet).permit(:petname, :breed)
    end
end
