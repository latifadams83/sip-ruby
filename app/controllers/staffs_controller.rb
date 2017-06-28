class StaffsController < ApplicationController
  before_action :set_staff, only: [:show, :edit, :update, :destroy, :contacts, :add_contact, :edit_contact, :update_contact]

  def index
    @staffs = Staff.all
    add_breadcrumb "Home", root_path
    add_breadcrumb "Staff", staffs_path, :title => "Staff"
  end

  def show
    add_breadcrumb "Home", root_path
    add_breadcrumb "Staff", staffs_path
    add_breadcrumb "#{@staff.full_name}", staff_path
  end

  def new
    @staff = Staff.new
    @roles = Role.all.order(:name)

    add_breadcrumb "Home", root_path
    add_breadcrumb "Staff", staffs_path
    add_breadcrumb "New", new_staff_path
  end

  def edit

    add_breadcrumb "Home", root_path
    add_breadcrumb "Staff", staffs_path
    add_breadcrumb "#{@staff.full_name}", staff_path
    add_breadcrumb "Edit", edit_staff_path
  end

  def create
    @staff = Staff.new(staff_params)
    @staff.created_by = current_user.email

      if params[:email].present? && params[:password].present?
        @user = User.new(user_params)
        @user.staffs << @staff
        if @user.save
          redirect_to(add_contact_staff_path(@staff), notice: "staff created successfully with user account")
        else
          render 'new'
        end
      else
        if @staff.save
          redirect_to(add_contact_staff_path(@staff), notice: 'staff created without user account')
        else
          render 'new'
        end
      end
  end

  def update
    respond_to do |format|
      @staff.updated_by = current_user.email
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

  #memboer routes

  def contacts
    @staff_address = @staff.staff_addresses.first
    @staff_contact = @staff.staff_contacts.first

    add_breadcrumb "Home", root_path
    add_breadcrumb "Staff", staffs_path
    add_breadcrumb "#{@staff.full_name}", staff_path
    add_breadcrumb "Address & Contact Info", contacts_staff_path
  end

  def add_contact
    if @staff.staff_addresses.first.blank? && @staff.staff_contacts.first.blank?
      @staff.staff_addresses.new
      @staff.staff_contacts.new
    end
    add_breadcrumb "Home", root_path
    add_breadcrumb "Staff", staffs_path
    add_breadcrumb "#{@staff.full_name}", staff_path
    add_breadcrumb "Add: Address & Contact", add_contact_staff_path
  end

  def edit_contact
    @staff.staff_addresses.first
    @staff.staff_contacts.first

    add_breadcrumb "Home", root_path
    add_breadcrumb "Staff", staffs_path
    add_breadcrumb "#{@staff.full_name}", staff_path
    add_breadcrumb "Update: Address & Contact", edit_contact_staff_path
  end
  def update_contact
    if @staff.update(staff_params)
      redirect_to contacts_staff_path(@staff), notice: 'Contacts was successfully updated.'
    else
      render :edit_contact
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_staff
      @staff = Staff.friendly.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def staff_params
      params.require(:staff).permit(:title, :first_name, :last_name, :gender, :date_of_birth, :religious_denomination, :marital_status, :photo, :phone, :joining_date, :staff_department_id, :specialization, :employment_id, :sssnit_no, :employee_id, :employment_date, :portal_access, :rank, :registered_no, :qualification, staff_addresses_attributes: [:id, :street_address, :city, :region, :postal_code], staff_contacts_attributes: [:id, :mobile_phone, :home_phone, :office_phone, :work_email, :personal_email])
    end

    def user_params
      params.permit(:role_id, :email, :password)
    end

end
