class PetsController < ApplicationController

  # before_action :set_pet, only: [:show, :edit, :update, :destroy]
  
  def index
    @pets = Pet.where(:status => nil).where.not(:primary_photo => nil).order(created_at: :desc)
    @breeds = Breed.all.order(:name)
    @searches = current_user ? UserSearch.where(:user_id => current_user.id).collect {|search| [search.name, search.search]} : nil
    @page = 1
  end

  def more_pets
    @pets = Pet.where(:status => nil).where.not(:primary_photo => nil).order(created_at: :desc)
    @page = params["page"].to_i || 1
    @res_partial = render :partial => 'more_pets' # broke these out in order to update link_to's for partials
    respond_to do |f|
      f.js { @res_partial } # passing partial as local variable to .js.erb avoids sizzle error
    end
  end

  def results
    @page = params["page"].to_i || 1
    @pets = Search.create_query(params)
    respond_to do |f|
      f.js { render :action => "results" }
    end
    if params["save_selections"]
      Search.save_search(current_user, params)
    end
  end

  def name_results
    @pets = Pet.where('lower(name) = ?', params[:name].downcase)
    @page = 1
    respond_to do |f|
      f.js { render :action => "results" }
    end
  end

  def more_results
    @page = params["page"].to_i || 1
    @pets = Search.create_query(params["locals"]["query_params"])
    @res_partial = render :partial => 'more_results'
    respond_to do |f|
      f.js { @res_partial } # passing partial as local variable to .js.erb avoids sizzle error
    end
  end

  def show
  end

  def my_pets
    @page = params["page"].to_i || 1
    @pets = Pet.joins(:user_pets).where(:user_pets => {:user_id => current_user.id})
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
