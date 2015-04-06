module DeviseApprovable
  autoload :Mailer, 'devise_approvable/mailer'
end

require 'devise'
require 'devise_approvable/routes'
# require 'devise_approvable/rails'

module Devise
  # Public: Validity period of the invitation token (default: 0). If
  # invite_for is 0 or nil, the invitation will never expire.
  # Set invite_for in the Devise configuration file (in config/initializers/devise.rb).
  #
  #   config.invite_for = 2.weeks # => The invitation token will be valid 2 weeks
  mattr_accessor :admin_email
  @@admin_email = "admin@curbcall.com"


end

Devise.add_module :approvable, :controller => :approvals, :model => 'devise_approvable/model', :route => {:approval => [nil, :new, :accept, :show]}