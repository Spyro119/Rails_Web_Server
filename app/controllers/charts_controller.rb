class ChartsController < ApplicationController
  
    # The number of unique requests (ContactId) grouped by Month (Creation Date)
    # def new_leads
    #     render json: Lead.group_by_month(:created_at).count
    # end
    
    # def by_month_leads
    #     render json: Lead.group_by_month_of_year(:created_at).count.map{ |k, v| [I18n.t("date.month_names")[k], v] }
    # end

    # The number of unique requests (QuoteId) grouped by Month (Creation Date)
    def new_quotes
        render json: Quote.group_by_month(:created_at).count
    end
    
    def by_month_quotes
        render json: Quote.group_by_month_of_year(:created_at).count.map{ |k, v| [I18n.t("date.month_names")[k], v] }
    end

    # The number of elevators (ElevatorId) contained in the buildings belonging to each customer
    # def new_elevators
    #     render json: Elevator.group_by_customer(:created_at).count
    # end
    
    # def by_customer_elevators
    #     render json: Elevator.group_by_customer(:created_at).count.map{ |k, v| [I18n.t("date.month_names")[k], v] }
    # end
end
