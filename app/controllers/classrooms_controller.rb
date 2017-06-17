class ClassroomsController < ApplicationController
  before_action :set_classroom, only: [:show, :edit, :update, :destroy]

  # GET /classrooms
  # GET /classrooms.json
  def index
    @classrooms = Classroom.all
    @classroom = Classroom.new
  end

  def show
  end

  def new
    @classroom = Classroom.new
  end

  def edit
  end

  def create
    @classroom = Classroom.new(classroom_params)
    @classroom.created_by = current_user.email

    respond_to do |format|
      if @classroom.save
        format.html { redirect_to classrooms_path, notice: 'Classroom was successfully created.' }
        format.json { render :show, status: :created, location: @classroom }
        format.js
      else
        format.html { render :new }
        format.json { render json: @classroom.errors, status: :unprocessable_entity }
        format.js
      end
    end
  end

  # PATCH/PUT /classrooms/1
  # PATCH/PUT /classrooms/1.json
  def update
    respond_to do |format|
      @classroom.updated_by = current_user.email
      if @classroom.update(classroom_params)
        format.html { redirect_to classrooms_path, notice: 'Classroom was successfully updated.' }
        format.json { render :show, status: :ok, location: @classroom }
        format.js
      else
        format.html { render :edit }
        format.json { render json: @classroom.errors, status: :unprocessable_entity }
        format.js
      end
    end
  end

  # DELETE /classrooms/1
  # DELETE /classrooms/1.json
  def destroy
    @classroom.destroy
    respond_to do |format|
      format.html { redirect_to classrooms_url, notice: 'Classroom was successfully destroyed.' }
      format.json { head :no_content }
      format.js
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_classroom
      @classroom = Classroom.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def classroom_params
      params.require(:classroom).permit(:name, :capacity)
    end
end
