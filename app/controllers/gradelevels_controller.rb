class GradelevelsController < ApplicationController
  before_action :set_gradelevel, only: [:show, :edit, :update, :destroy]

  # GET /gradelevels
  # GET /gradelevels.json
  def index
    @gradelevels = Gradelevel.all
    @gradelevel = Gradelevel.new
  end

  def show
  end

  def new
    @gradelevel = Gradelevel.new
  end

  def edit
  end

  def create
    @gradelevel = Gradelevel.new(gradelevel_params)
    @gradelevel.created_by = current_user.id

    respond_to do |format|
      if @gradelevel.save
        format.html { redirect_to @gradelevel, notice: 'Gradelevel was successfully created.' }
        format.json { render :show, status: :created, location: @gradelevel }
        format.js
      else
        format.html { render :new }
        format.json { render json: @gradelevel.errors, status: :unprocessable_entity }
        format.js
      end
    end
  end

  # PATCH/PUT /gradelevels/1
  # PATCH/PUT /gradelevels/1.json
  def update
    respond_to do |format|
          @gradelevel.updated_by = current_user.id
      if @gradelevel.update(gradelevel_params)
        format.html { redirect_to @gradelevel, notice: 'Gradelevel was successfully updated.' }
        format.json { render :show, status: :ok, location: @gradelevel }
        format.js
      else
        format.html { render :edit }
        format.json { render json: @gradelevel.errors, status: :unprocessable_entity }
        format.js
      end
    end
  end

  # DELETE /gradelevels/1
  # DELETE /gradelevels/1.json
  def destroy
    @gradelevel.destroy
    respond_to do |format|
      format.html { redirect_to gradelevels_url, notice: 'Gradelevel was successfully destroyed.' }
      format.json { head :no_content }
      format.js
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_gradelevel
      @gradelevel = Gradelevel.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def gradelevel_params
      params.require(:gradelevel).permit(:name, :level)
    end
end
