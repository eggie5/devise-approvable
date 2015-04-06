require 'devise/version'

module DeviseApprovable
  module Mailer

    def approval_instructions(record, token, opts={})
      @token = token
      devise_mail(record, :approval_instructions, opts)
    end
  end
end