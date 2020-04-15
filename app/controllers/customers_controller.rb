class CustomersController < ApplicationController
    before_action :set_intervention, only: [:show, :edit, :update, :destroy]
    
  
    # GET /interventions
    # GET /interventions.json
    def index
      @customers = Customer.all
    end
  
    # GET /interventions/1
    # GET /interventions/1.json
    def show
    end
  
    # GET /interventions/new
    def new
   
    end
  
    def get_drop_down_options
      val = params[:id]
      puts val
      #Use val to find records
      options = Building.collect{|x| "'#{x.id}' : '#{x.customer_id}'"}    
      render :text => "{#{options.join(",")}}" 
    end
  
    # GET /interventions/1/edit
    def edit
    end
  
    # POST /interventions
    # POST /interventions.json
    def create
      @customer = Customer.new(intervention_params)
  
      respond_to do |format|
        if @customer.save
          format.html { redirect_to @intervention, notice: 'Intervention was successfully created.' }
          format.json { render :show, status: :created, location: @customer }
        else
          format.html { render :new }
          format.json { render json: @customer.errors, status: :unprocessable_entity }
        end
      end
    end
  
    # PATCH/PUT /interventions/1
    # PATCH/PUT /interventions/1.json
    def update
      respond_to do |format|
        if @customer.update(intervention_params)
          format.html { redirect_to @intervention, notice: 'Intervention was successfully updated.' }
          format.json { render :show, status: :ok, location: @customer }
        else
          format.html { render :edit }
          format.json { render json: @customer.errors, status: :unprocessable_entity }
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
  