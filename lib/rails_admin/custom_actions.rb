module RailsAdmin
    module Config

      RailsAdmin.config do |config|
        config.current_user_method do
          current_admin
        end
      end
      
      module Actions

        class Customaction < RailsAdmin::Config::Actions::Base
          register_instance_option :member do 
            true
          end
          register_instance_option :pjax? do
            false
          end
          register_instance_option :visible? do
            authorized? 		
          end
        end
        class Foo < Customaction
          RailsAdmin::Config::Actions.register(self)
          register_instance_option :only do
           root
           collection
          end
        end
        #   register_instance_option :link_icon do
        #     'fa fa-paper-plane' 
        #   end
        #   register_instance_option :http_methods do
        #     [:get, :post]
        #   end
        #   register_instance_option :controller do
        #     Proc.new do
              
        #       flash[:notice] = "Did custom action on #{@object.name}"
        #       redirect_to back_or_index
        #     end
        #   end
        # end
        # class Bar < Customaction
        # end
        class Collection < RailsAdmin::Config::Actions::Base
          RailsAdmin::Config::Actions.register(self)
          register_instance_option :collection do
            true	
          end
        end
        class Root < RailsAdmin::Config::Actions::Base
          RailsAdmin::Config::Actions.register(self)
          register_instance_option :root do
            true	
          end
        end
      end
    end
  end