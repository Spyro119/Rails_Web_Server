class InterventionsController < ApplicationController
  before_action :set_intervention, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_employee!
  before_action :authorize_admin, only: 


  # GET /interventions
  # GET /interventions.json
  def index
    @interventions = Intervention.all
  end

  # GET /interventions/1
  # GET /interventions/1.json
  def show
  end

  # GET /interventions/new
  def new
    @intervention = Intervention.new
    @customers = Customer.all
    @employees = Employee.all
    @buildings = Building.all
    @customer = Customer.first

     @building = Building.find_by customer_id: @customer.id
  end

  def get_building
    if params[:customer_id].present?
      @building = []
      @building = Customer.find(params[:customer_id]).building
  else
      @building = Building.all
  end
  if request.xhr?
      respond_to do |format|
          format.json {
              render json: {building: @building}
          }
      end
  end
  end

  def get_battery
    if params[:battery_id].present?
      @battery = []
      @battery = Building.find(params[:battery_id]).battery
  else
      @battery = Battery.all
  end
  if request.xhr?
      respond_to do |format|
          format.json {
              render json: {battery: @battery}
          }
      end
  end
  end

  def get_column
    if params[:column_id].present?
      @column = []
      @column = Battery.find(params[:column_id]).column
  else
      @column = Column.all
  end
  if request.xhr?
      respond_to do |format|
          format.json {
              render json: {column: @column}
          }
      end
  end
  end

  def get_elevator
    if params[:elevator_id].present?
      @elevator = []
      @elevator = Column.find(params[:elevator_id]).elevator
  else
      @elevator = Elevator.all
  end
  if request.xhr?
      respond_to do |format|
          format.json {
              render json: {elevator: @elevator}
          }
      end
  end
  end

  # GET /interventions/1/edit
  def edit
  end

  # POST /interventions
  # POST /interventions.json
  def create
    @intervention = Intervention.new(intervention_create_params)

    respond_to do |format|
      if @intervention.save
        format.html { redirect_to @intervention, notice: 'Intervention was successfully created.' }
        format.json { render :show, status: :created, location: @intervention }
      else
        format.html { render :new }
        format.json { render json: @intervention.errors, status: :unprocessable_entity }
      end
    end
  end

  def intervention_create_params
    params.require(:intervention).permit(:author, :customer_id, :building_id, :battery_id, :column_id, :elevator_id, :employee_id, :report)
  end

  # PATCH/PUT /interventions/1
  # PATCH/PUT /interventions/1.json
  def update
    respond_to do |format|
      if @intervention.update(intervention_params)
        format.html { redirect_to @intervention, notice: 'Intervention was successfully updated.' }
        format.json { render :show, status: :ok, location: @intervention }
      else
        format.html { render :edit }
        format.json { render json: @intervention.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /interventions/1
  # DELETE /interventions/1.json
  def destroy
    @intervention.destroy
    respond_to do |format|
      format.html { redirect_to interventions_url, notice: 'Intervention was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_intervention
      @intervention = Intervention.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def intervention_params
      params.fetch(:intervention, {})
    end
end
