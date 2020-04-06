class QuotesController < ApplicationController
  skip_before_action :verify_authenticity_token
  after_action do 
    q = Quote.last
    create_quote_ticket(q.id, q.email, q.BuildingType, q.NbrElevators, q.TotalPrice)
  end

  
  
  def create
  quote = Quote.new

  quote.email = params[:userEmail]
  
      if params[:building_type] == 'commercial'

        quote.BuildingType = params[:building_type]
        quote.NbrFloors = params[:NbrFloorCommercial]
        quote.NbrBassements = params[:NbrBasementCommercial]
        quote.NbrElevators = params[:ResultElevator]
        quote.ElevatorQuality = params[:services]
        quote.ElevatorCost = params[:PriceUnit]
        quote.InstallationPrice = params[:InstallationCost]
        quote.TotalPrice = params[:TotalCost]
        quote.NbrBusinesses = params[:NbrSeparateBusinessCommercial||:NbrSeparateBusinessHybrid]
        quote.NbrParking = params[:NbrParkingCommercial||:NbrParkingCorporate||:NbrParkingHybrid]
      
      
      elsif params[:building_type] == 'residental'

        quote.BuildingType = params[:building_type]
        quote.NbrAppt = params[:NbrApartment]
        quote.NbrFloors = params[:NbrFloorResidential]
        quote.NbrBassements = params[:NbrBasementResidential]
        quote.NbrElevators = params[:ResultElevator]
        quote.ElevatorQuality = params[:services]
        quote.ElevatorCost = params[:PriceUnit]
        quote.InstallationPrice = params[:InstallationCost]
        quote.TotalPrice = params[:TotalCost]
  
      elsif params[:building_type] == 'corporate'

          quote.BuildingType = params[:building_type]
          quote.NbrFloors = params[:NbrFloorCorporate]
          quote.NbrBassements = params[:NbrBasementCorporate]
          quote.NbrElevators = params[:ResultElevator]
          quote.ElevatorQuality = params[:services]
          quote.ElevatorCost = params[:PriceUnit]
          quote.InstallationPrice = params[:InstallationCost]
          quote.TotalPrice = params[:TotalCost]
          quote.NbrBusinesses = params[:NbrSeparateBusinessHybrid]
          quote.NbrParking = params[:NbrParkingCorporate]
          quote.NbrRentalCompagnies = params[:NbrTenant]
          quote.NbrOccupanrtPerFloor = params[:NbrMaxOccupantCorporate]

        elsif params[:building_type] == 'hybrid'

          quote.BuildingType = params[:building_type]
          quote.NbrFloors = params[:NbrFloorHybrid]
          quote.NbrBassements = params[:NbrBasementHybrid]
          quote.NbrElevators = params[:ResultElevator]
          quote.ElevatorQuality = params[:services]
          quote.ElevatorCost = params[:PriceUnit]
          quote.InstallationPrice = params[:InstallationCost]
          quote.TotalPrice = params[:TotalCost]
          quote.NbrBusinesses = params[:NbrSeparateBusinessHybrid]
          quote.NbrParking = params[:NbrParkingHybrid]
          quote.NbrOccupanrtPerFloor = params[:NbrMaxOccupantHybrid]
          quote.WorkingHours = params[:NbrActivityHour]

    end
    quote.save!
    redirect_to "/pages/SubmissionForm"
  end
end