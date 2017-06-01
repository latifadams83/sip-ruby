class StaffCategoriesController < ApplicationController
  before_action :set_staff_category, only: [:edit, :update, :destroy]

  # GET /staff_categories
  # GET /staff_categories.json
  def index
    @staff_categories = StaffCategory.all
    @staff_category = StaffCategory.new
  end

  # GET /staff_categories/1
  # GET /staff_categories/1.json
  def show
  end

  # GET /staff_categories/new
  def new
    @staff_category = StaffCategory.new
  end

  # GET /staff_categories/1/edit
  def edit
  end

  # POST /staff_categories
  # POST /staff_categories.json
  def create
    @staff_category = StaffCategory.new(staff_category_params)

    respond_to do |format|
      if @staff_category.save
        format.html { redirect_to staff_categories_path, notice: 'Staff category was successfully created.' }
        format.json { render :show, status: :created, location: @staff_category }
        format.js
      else
        format.html { render :new }
        format.json { render json: @staff_category.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /staff_categories/1
  # PATCH/PUT /staff_categories/1.json
  def update
    respond_to do |format|
      if @staff_category.update(staff_category_params)
        format.html { redirect_to staff_categories_path, notice: 'Staff category was successfully updated.' }
        format.json { render :show, status: :ok, location: @staff_category }
        format.js
      else
        format.html { render :edit }
        format.json { render json: @staff_category.errors, status: :unprocessable_entity }
        format.js
      end
    end
  end

  # DELETE /staff_categories/1
  # DELETE /staff_categories/1.json
  def destroy
    @staff_category.destroy
    respond_to do |format|
      format.html { redirect_to staff_categories_url, notice: 'Staff category was successfully destroyed.' }
      format.json { head :no_content }
      format.js
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_staff_category
      @staff_category = StaffCategory.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def staff_category_params
      params.require(:staff_category).permit(:name)
    end
end
