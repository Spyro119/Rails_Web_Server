class ApplicationController < ActionController::Base
    before_action :configure_permitted_parameters, if: :devise_controller?
    protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:firstname, :lastname, :function])
  end
  # def custom_bootstrap_flash
  #   flash_messages = []
  #   flash.each do |type, message|
  #     type = 'success' if type == 'notice'
  #     type = 'error'   if type == 'alert'
  #     text = "<script>toastr.#{type}('#{message}');</script>"
  #     flash_messages << text.html_safe if message
  #   end
  #   flash_messages.join("\n").html_safe
  # end
end