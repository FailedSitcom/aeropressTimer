class RecipesController < ApplicationController
#  before_action :require_user
  before_action :set_recipe, only: [:show, :edit, :update, :destroy, :email]
  before_action :set_back_link, except: [:index]
  before_filter :require_permission, only: [:edit, :destroy]
<<<<<<< HEAD
=======
  #before_filter :require_permission, only: :destroy
>>>>>>> c4f1582847aa778f88d0da0a7f66e578666aa6ca

def require_permission
  if current_user != Recipe.find(params[:id]).user
    redirect_to recipe_path(@recipe), error: "You can only edit and delete your own recipes."
    #Or do something else here
  end
end

  # GET /recipes
  # GET /recipes.json
  def index
    @recipes = Recipe.all
  end

  # GET /recipes/1
  # GET /recipes/1.json
  def show
  end

  # GET /recipes/new
  def new
    @recipe = Recipe.new
  end

  # GET /recipes/1/edit
  def edit
  end

  # POST /recipes
  # POST /recipes.json
  def create
    @recipe = current_user.recipes.new(recipe_params)

    respond_to do |format|
      if @recipe.save
        format.html { redirect_to @recipe, success: 'Recipe was successfully created.' }
        format.json { render :show, status: :created, location: @recipe }
      else
        format.html { render :new }
        format.json { render json: @recipe.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /recipes/1
  # PATCH/PUT /recipes/1.json
  def update
    respond_to do |format|
      if @recipe.update(recipe_params)
        format.html { redirect_to @recipe, success: 'Recipe was successfully updated.' }
        format.json { render :show, status: :ok, location: @recipe }
      else
        format.html { render :edit }
        format.json { render json: @recipe.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /recipes/1
  # DELETE /recipes/1.json
  def destroy
    @recipe.destroy
    respond_to do |format|
      format.html { redirect_to recipes_url, notice: 'Recipe was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def email
    destination = params[:to]
    notifier = Notifier.recipe(@recipe, destination)
    if destination =~ /@/ && notifier.deliver
      redirect_to recipe_path(@recipe), success: "Recipe sent."
    else
      redirect_to recipe_path(@recipe), error: "Recipe could not be sent."
    end
  end

  private
    def set_back_link
      go_back_link_to recipes_path
    end
    # Use callbacks to share common setup or constraints between actions.
    def set_recipe
      @recipe = Recipe.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def recipe_params
      params.require(:recipe).permit(:title, :coffee, :water, :seconds, :description)
    end
end
