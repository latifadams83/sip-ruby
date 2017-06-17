class StaffsController < ApplicationController
  before_action :set_staff, only: [:show, :edit, :update, :destroy]

  def index
    @staffs = Staff.all
  end

  def show
  end

  def new
    @staff = Staff.new
    @roles = Role.all.order(:name)
  end

  def edit
    @roles = Role.all.order(:name)
  end

  def create
    @staff = Staff.new(staff_params)
    @staff.created_by = current_user.id

    respond_to do |format|
      if @staff.save
        format.html { redirect_to staff_path(@staff), notice: 'Staff Created.' }
        format.json { render :show, status: :created, location: @staff }
      else
        format.html { render :new }
        format.json { render json: @staff.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      @staff.updated_by = current_user.id
      if @staff.update(staff_params)
        format.html { redirect_to @staff, notice: 'Staff was successfully updated.' }
        format.json { render :show, status: :ok, location: @staff }
      else
        format.html { render :edit }
        format.json { render json: @staff.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @staff.destroy
    respond_to do |format|
      format.html { redirect_to staffs_url, notice: 'Staff was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_staff
      @staff = Staff.friendly.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def staff_params
      params.require(:staff).permit(:title, :first_name, :middle_name, :last_name, :gender, :date_of_birth, :religious_denomination, :disability, :marital_status, :photo, :joining_date, :staff_category_id, :specialization, :appointment_date, :sssnit_no, :employee_id, :rank, :registered_no, :portal_access)
    end

    def user_params
      params.permit(:role, :email, :pa)
    end

end
