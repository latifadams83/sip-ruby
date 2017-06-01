class StaffDepartmentsController < ApplicationController
  before_action :set_staff_department, only: [:show, :edit, :update, :destroy]

  # GET /staff_departments
  # GET /staff_departments.json
  def index
    @staff_departments = StaffDepartment.all
    @staff_department = StaffDepartment.new
  end

  # GET /staff_departments/1
  # GET /staff_departments/1.json
  def show
  end

  # GET /staff_departments/new
  def new
    @staff_department = StaffDepartment.new
  end

  # GET /staff_departments/1/edit
  def edit
  end

  # POST /staff_departments
  # POST /staff_departments.json
  def create
    @staff_department = StaffDepartment.new(staff_department_params)

    respond_to do |format|
      if @staff_department.save
        format.html { redirect_to staff_department_path, notice: 'Staff department was successfully created.' }
        format.json { render :show, status: :created, location: @staff_department }
        format.js
      else
        format.html { render :new }
        format.json { render json: @staff_department.errors, status: :unprocessable_entity }
        format.js
      end
    end
  end

  # PATCH/PUT /staff_departments/1
  # PATCH/PUT /staff_departments/1.json
  def update
    respond_to do |format|
      if @staff_department.update(staff_department_params)
        format.html { redirect_to staff_department_path, notice: 'Staff department was successfully updated.' }
        format.json { render :show, status: :ok, location: @staff_department }
        format.js
      else
        format.html { render :edit }
        format.json { render json: @staff_department.errors, status: :unprocessable_entity }
        format.js
      end
    end
  end

  # DELETE /staff_departments/1
  # DELETE /staff_departments/1.json
  def destroy
    @staff_department.destroy
    respond_to do |format|
      format.html { redirect_to staff_departments_url, notice: 'Staff department was successfully destroyed.' }
      format.json { head :no_content }
      format.js
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_staff_department
      @staff_department = StaffDepartment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def staff_department_params
      params.require(:staff_department).permit(:name, :staff_category_id)
    end
end
