require 'devise/version'

module DeviseInvitable
  module Mailer

    def approval_instructions(record, token, opts={})
      @token = token
      devise_mail(record, :approval_instructions, opts)
    end
  end
end