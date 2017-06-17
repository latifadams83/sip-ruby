class SchoolInfosController < ApplicationController
  before_action :set_school_info, only: [:show, :edit, :update, :destroy]

  def index
    @school_infos = SchoolInfo.all
  end

  def show
  end

  def new
    @school_info = SchoolInfo.new
  end

  def edit
  end

  def create
    @school_info = SchoolInfo.new(school_info_params)
    @school_info.created_by = current_user.email

    respond_to do |format|
      if @school_info.save
        format.html { redirect_to school_infos_path, notice: 'School info was successfully created.' }
        format.json { render :show, status: :created, location: @school_info }
      else
        format.html { render :new }
        format.json { render json: @school_info.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      @school_info.updated_by = current_user.email
      if @school_info.update(school_info_params)
        format.html { redirect_to school_infos_path, notice: 'School info was successfully updated.' }
        format.json { render :show, status: :ok, location: @school_info }
      else
        format.html { render :edit }
        format.json { render json: @school_info.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @school_info.destroy
    respond_to do |format|
      format.html { redirect_to school_infos_url, notice: 'School info was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_school_info
      if SchoolInfo.first.nil?
        @school_info = nil
      else
        @school_info = SchoolInfo.first
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def school_info_params
      params.require(:school_info).permit(:name, :alias, :code, :slogan, :location, :city, :region, :postal_code, :email, :phone, :logo)
    end
end
