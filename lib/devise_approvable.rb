p "Loading Devise Approvable"

module DeviseApprovable
  autoload :Mailer, 'devise_approvable/mailer'
end

require 'devise'
require 'devise_approvable/routes'
# require 'devise_approvable/rails'

module Devise
  mattr_accessor :admin_email
  @@admin_email = "admin@curbcall.com"
end

Devise.add_module :approvable, :controller => :approvals, :model => 'devise_approvable/model', :route => {:approval => [nil, :new, :accept, :show]}