class InterventionsController < ApplicationController
  protect_from_forgery
  before_action :set_intervention, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_employee!
  before_action :authorize_employee, only:
 

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
  end

  def get_building
    if params[:customer_id].present?
      @building = []
      @building = Customer.find(params[:customer_id]).building
      # @building = Building.where(id: params[:customer_id])
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
      params[:batter_id].sanitize
      @battery = []
      @battery = Building.find(params[:battery_id]).battery
      # @battery = Battery.where(id: params[:battery_id])
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
      # @column = Column.where(id: params[:column_id])
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
      # @elevator = Elevator.where(id: params[:elevator_id])
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
    val = @intervention.customer_id 
    @client = Customer.find(val)

    if @intervention.employee_id? 
      employee_id = @intervention.employee_id
      @employee = Employee.find(employee_id)
    end

    respond_to do |format|
      if @intervention.save
        format.html { redirect_to new_intervention_path, notice: 'Intervention was successfully created.' }
        format.json { render :show, status: :created, location: @intervention }
        
        if @intervention.employee_id? && @intervention.elevator_id?
          create_intervention_ticket(@intervention.id, @client.company_contact_full_name, @client.company_name, @intervention.building_id, @intervention.battery_id, @intervention.column_id, @intervention.elevator_id, @employee, current_employee.firstname + " " + current_employee.lastname, @intervention.report)
        
        elsif @intervention.employee_id? && @intervention.column_id?
          create_ticket2(@intervention.id, @client.company_contact_full_name, @client.company_name, @intervention.building_id, @intervention.battery_id, @intervention.column_id, @employee, current_employee.firstname + " " + current_employee.lastname, @intervention.report)
        
        elsif @intervention.employee_id? && @intervention.battery_id? 
          create_ticket3(@intervention.id, @client.company_contact_full_name, @client.company_name, @intervention.building_id, @intervention.battery_id, @employee, current_employee.firstname + " " + current_employee.lastname, @intervention.report)
       
        elsif @intervention.employee_id?
          create_ticket4(@intervention.id, @client.company_contact_full_name, @client.company_name, @intervention.building_id, @employee, current_employee.firstname + " " + current_employee.lastname, @intervention.report)
       
        elsif @intervention.elevator_id?
          create_ticket5(@intervention.id, @client.company_contact_full_name, @client.company_name, @intervention.building_id, @intervention.battery_id, @intervention.column_id, @intervention.elevator_id, current_employee.firstname + " " + current_employee.lastname, @intervention.report)
       
        elsif @intervention.column_id? 
          create_ticket6(@intervention.id, @client.company_contact_full_name, @client.company_name, @intervention.building_id, @intervention.battery_id, @intervention.column_id, current_employee.firstname + " " + current_employee.lastname, @intervention.report)
       
        elsif @intervention.battery_id?
          create_ticket7(@intervention.id, @client.company_contact_full_name, @client.company_name, @intervention.building_id, @intervention.battery_id, current_employee.firstname + " " + current_employee.lastname, @intervention.report)
       
        else 
          create_ticket8(@intervention.id, @client.company_contact_full_name, @client.company_name, @intervention.building_id, current_employee.firstname + " " + current_employee.lastname, @intervention.report)
        end
        
      else
        format.html { render :new }
        format.json { render json: @intervention.errors, status: :unprocessable_entity }
      end
    end
  end

  def intervention_create_params
    params.require(:intervention).permit(:author, :customer_id, :building_id, :battery_id, :column_id, :elevator_id, :employee_id, :report, :result, :status)
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
