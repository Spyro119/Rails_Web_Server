require 'zendesk_api'

def create_ticket(user_name, company_name, email, phone_number, department, project_name, project_description, message)
@client = ZendeskAPI::Client.new do |config|
  # Mandatory:

  config.url = "https://rocketelevators6984.zendesk.com/api/v2" # e.g. https://mydesk.zendesk.com/api/v2

  # Basic / Token Authentication
  config.username = ENV["Zendesk_email"]

  # Choose one of the following depending on your authentication choice
  # config.token = "Zendesk_Token"
  config.password = ENV["Zendesk_password"]

  # OAuth Authentication

  # config.access_token = ENV["rocket_elevators_api"]


  # Optional:

  # Retry uses middleware to notify the user
  # when hitting the rate limit, sleep automatically,
  # then retry the request.
  config.retry = true

  # Raise error when hitting the rate limit.
  # This is ignored and always set to false when `retry` is enabled.
  # Disabled by default.
  config.raise_error_when_rate_limited = false

  # Logger prints to STDERR by default, to e.g. print to stdout:
  require 'logger'
  config.logger = Logger.new(STDOUT)

  # Changes Faraday adapter
  # config.adapter = :patron

  # Merged with the default client options hash
  # config.client_options = {:ssl => {:verify => false}, :request => {:timeout => 30}}

  # When getting the error 'hostname does not match the server certificate'
  # use the API at https://yoursubdomain.zendesk.com/api/v2
  end 

    ticket = ZendeskAPI::Ticket.new(@client, :id => 1)
    ZendeskAPI::Ticket.create!(@client, :subject => " #{user_name} from #{company_name}", 
    :comment => { :value => "
    Comment: The contact #{user_name} from company #{company_name} can be reached at email  #{email} and at phone number #{phone_number}. #{department} has a project named #{project_name} which would require contribution from Rocket Elevators. 
    #{project_description}
    Attached Message:
    #{message}"
    },  
    :priority => 'urgent',
    :type => "question",
    requester: {"name": email}) 
end


  def create_quote_ticket(quote_id, email, service_type, elevNum, price)
    @client = ZendeskAPI::Client.new do |config|
      config.url = "https://rocketelevators6984.zendesk.com/api/v2" # e.g. https://mydesk.zendesk.com/api/v2
      config.username = ENV["Zendesk_email"]
      config.password = ENV["Zendesk_password"]
      config.retry = true
      config.raise_error_when_rate_limited = false
      require 'logger'
      config.logger = Logger.new(STDOUT)
    end 
    
    ticket = ZendeskAPI::Ticket.new(@client, :id => 1)
    ZendeskAPI::Ticket.create!(@client, :subject => " Quote : #{quote_id}", 
      :comment => { :value =>" 
        A quote has been sent. The customer is reachable at email #{email} and requests our #{service_type} service with a total of #{elevNum} elevator(s). Total price is estimated at #{price}$
        You can find the quote #{quote_id} directly in the admin section of rocket elevator's website."},
        :priority => "normal",
        :type => "task",
        requester: {"name": email}) 
       
      end
    

def create_intervention_ticket(intervention, customer, customer_company, building, battery, column, elevator, employee, requester)
  @client = ZendeskAPI::Client.new do |config|
    config.url = "https://rocketelevators6984.zendesk.com/api/v2" # e.g. https://mydesk.zendesk.com/api/v2
    config.username = ENV["Zendesk_email"]
    config.password = ENV["Zendesk_password"]
    config.retry = true
    config.raise_error_when_rate_limited = false
    require 'logger'
    config.logger = Logger.new(STDOUT)
  end 
  
  ticket = ZendeskAPI::Ticket.new(@client, :id => 1)
  ZendeskAPI::Ticket.create!(@client, :subject => " Intervention # #{intervention}", 
    :comment => { :value =>" 
      Customer #{customer} request helps for #{customer_company} at his building # #{building} for 
      his battery # #{battery}, column # #{column}, elevator # #{elevator}. #{employee.firstname} #{employee.lastname} has been affected to this ticket."},
      :priority => "normal",
      :type => "problem",
      requester: {"name": requester}) 
    end
  

def create_ticket2(intervention, customer, customer_company, building, battery, column, employee, requester)
  @client = ZendeskAPI::Client.new do |config|
    config.url = "https://rocketelevators6984.zendesk.com/api/v2" # e.g. https://mydesk.zendesk.com/api/v2
    config.username = ENV["Zendesk_email"]
    config.password = ENV["Zendesk_password"]
    config.retry = true
    config.raise_error_when_rate_limited = false
    require 'logger'
    config.logger = Logger.new(STDOUT)
  end 
  ticket = ZendeskAPI::Ticket.new(@client, :id => 1)
  ZendeskAPI::Ticket.create!(@client, :subject => " Intervention # #{intervention}", 
    :comment => { :value =>" 
      Customer #{customer} request helps for #{customer_company} at his building # #{building} for 
      his battery # #{battery}, column # #{column}. #{employee.firstname} #{employee.lastname} has been affected to this ticket."},
      :priority => "normal",
      :type => "problem",
      requester: {"name": requester}) 
    end 


def create_ticket3(intervention, customer, customer_company, building, battery, employee, requester)
  @client = ZendeskAPI::Client.new do |config|
    config.url = "https://rocketelevators6984.zendesk.com/api/v2" # e.g. https://mydesk.zendesk.com/api/v2
    config.username = ENV["Zendesk_email"]
    config.password = ENV["Zendesk_password"]
    config.retry = true
    config.raise_error_when_rate_limited = false
    require 'logger'
    config.logger = Logger.new(STDOUT)
  end 
  ticket = ZendeskAPI::Ticket.new(@client, :id => 1)
  ZendeskAPI::Ticket.create!(@client, :subject => " Intervention # #{intervention}", 
    :comment => { :value =>" 
      Customer #{customer} request helps for #{customer_company} at his building # #{building} for 
      his battery # #{battery}. #{employee.firstname} #{employee.lastname} has been affected to this ticket."},
      :priority => "normal",
      :type => "problem",
      requester: {"name": requester}) 
    end

def create_ticket4(intervention, customer, customer_company, building, employee, requester)
  @client = ZendeskAPI::Client.new do |config|
    config.url = "https://rocketelevators6984.zendesk.com/api/v2" # e.g. https://mydesk.zendesk.com/api/v2
    config.username = ENV["Zendesk_email"]
    config.password = ENV["Zendesk_password"]
    config.retry = true
    config.raise_error_when_rate_limited = false
    require 'logger'
    config.logger = Logger.new(STDOUT)
  end 
  ticket = ZendeskAPI::Ticket.new(@client, :id => 1)
  ZendeskAPI::Ticket.create!(@client, :subject => " Intervention # #{intervention}", 
    :comment => { :value =>" 
      Customer #{customer} request helps for #{customer_company} at his building # #{building}.
      #{employee.firstname} #{employee.lastname} has been affected to this ticket."},
      :priority => "normal",
      :type => "problem",
      requester: {"name": requester}) 
  end



    
def create_ticket5(intervention, customer, customer_company, building, battery, column, elevator, requester) 
  @client = ZendeskAPI::Client.new do |config|
    config.url = "https://rocketelevators6984.zendesk.com/api/v2" # e.g. https://mydesk.zendesk.com/api/v2
    config.username = ENV["Zendesk_email"]
    config.password = ENV["Zendesk_password"]
    config.retry = true
    config.raise_error_when_rate_limited = false
    require 'logger'
    config.logger = Logger.new(STDOUT)
  end 
  ticket = ZendeskAPI::Ticket.new(@client, :id => 1)
    ZendeskAPI::Ticket.create!(@client, :subject => " Intervention # #{intervention}", 
      :comment => { :value =>" 
        Customer #{customer} request helps for #{customer_company} at his building # #{building} for 
        his battery # #{battery}, column # #{column}, elevator # #{elevator}. An employee has not yet been attached to this request."},
        :priority => "normal",
        :type => "problem",
        requester: {"name": requester}) 
      end

def create_ticket6(intervention, customer, customer_company, building, battery, column, requester)
      @client = ZendeskAPI::Client.new do |config|
        config.url = "https://rocketelevators6984.zendesk.com/api/v2" # e.g. https://mydesk.zendesk.com/api/v2
        config.username = ENV["Zendesk_email"]
        config.password = ENV["Zendesk_password"]
        config.retry = true
        config.raise_error_when_rate_limited = false
        require 'logger'
        config.logger = Logger.new(STDOUT)
      end 
    
      ticket = ZendeskAPI::Ticket.new(@client, :id => 1)
        ZendeskAPI::Ticket.create!(@client, :subject => " Intervention # #{intervention}", 
          :comment => { :value =>" 
          Customer #{customer} request helps for #{customer_company} at his building # #{building} for 
          his battery # #{battery}, column # #{column}. An employee has not yet been attached to this request."},
          :priority => "normal",
          :type => "problem",
          requester: {"name": requester}) 
      end
  
def create_ticket7(intervention, customer, customer_company, building, battery, requester)
        @client = ZendeskAPI::Client.new do |config|
          config.url = "https://rocketelevators6984.zendesk.com/api/v2" # e.g. https://mydesk.zendesk.com/api/v2
          config.username = ENV["Zendesk_email"]
          config.password = ENV["Zendesk_password"]
          config.retry = true
          config.raise_error_when_rate_limited = false
          require 'logger'
          config.logger = Logger.new(STDOUT)
        end 
      
        ticket = ZendeskAPI::Ticket.new(@client, :id => 1)
          ZendeskAPI::Ticket.create!(@client, :subject => " Intervention # #{intervention}", 
            :comment => { :value =>" 
            Customer #{customer} request helps for #{customer_company} at his building # #{building} for 
            his battery # #{battery}. An employee has not yet been attached to this request."},
            :priority => "normal",
            :type => "problem",
            requester: {"name": requester}) 
        end

def create_ticket8(intervention, customer, customer_company, building, requester)
          @client = ZendeskAPI::Client.new do |config|
            config.url = "https://rocketelevators6984.zendesk.com/api/v2" # e.g. https://mydesk.zendesk.com/api/v2
            config.username = ENV["Zendesk_email"]
            config.password = ENV["Zendesk_password"]
            config.retry = true
            config.raise_error_when_rate_limited = false
            require 'logger'
            config.logger = Logger.new(STDOUT)
          end 
    
          ticket = ZendeskAPI::Ticket.new(@client, :id => 1)
            ZendeskAPI::Ticket.create!(@client, :subject => " Intervention # #{intervention}", 
              :comment => { :value =>" 
              Customer #{customer} request helps for #{customer_company} at his building # #{building}.
               An employee has not yet been attached to this request."},
              :priority => "normal",
              :type => "problem",
              requester: {"name": requester}) 
    end

    # create_ticket2()
  # create_quote_ticket(140, "support@rocketelevators.com", "Commercial", "2", "13 000")
  # create_ticket("Samuel", "Rocket &Co", "SamuelJubinville119@gmail.com", "4388221756", "Commercial", "Genesis", "Project 1", "Hello world")
