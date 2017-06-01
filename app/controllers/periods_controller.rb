class PeriodsController < ApplicationController
  before_action :set_period, only: [:show, :edit, :update, :destroy]

  def index
    @periods = Period.all
    @period = Period.new
  end

  def show
  end

  def new
    @period = Period.new
  end

  def edit
  end

  def create
    @period = Period.new(period_params)
    @period.created_by = current_user.id
    respond_to do |format|
      if @period.save
        format.html { redirect_to @period, notice: 'Period was successfully created.' }
        format.json { render :show, status: :created, location: @period }
        format.js
      else
        format.html { render :new }
        format.json { render json: @period.errors, status: :unprocessable_entity }
        format.js
      end
    end
  end

  def update
    @period.updated_by = current_user.id
    respond_to do |format|
      if @period.update(period_params)
        format.html { redirect_to @period, notice: 'Period was successfully updated.' }
        format.json { render :show, status: :ok, location: @period }
        format.js
      else
        format.html { render :edit }
        format.json { render json: @period.errors, status: :unprocessable_entity }
        format.js
      end
    end
  end

  def destroy
    @period.destroy
    respond_to do |format|
      format.html { redirect_to periods_url, notice: 'Period was successfully destroyed.' }
      format.json { head :no_content }
      format.js
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_period
      @period = Period.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def period_params
      params.require(:period).permit(:name, :start_time, :end_time)
    end
end
