module Devise
  module Models
    module Approvable

      def self.included(base)
        puts "Devise::Models::Approvable module injected into #{self.class} class"

        base.class_eval do
          extend ClassMethods

          before_create :generate_approval_token, :if => :approval_required?
          after_create  :send_approval_instructions, :unless => :approved?
        end
      end

      #override
      def active_for_authentication? 
          super && approved? 
      end 

      #override
      def inactive_message 
        if !approved? 
          :not_approved 
        else 
          super # Use whatever other message 
        end 
      end


      def approve!
        self.approved_at = Time.now.utc
        self.approval_token = nil
        save(:validate => false)
      end

      # Verifies whether a user is confirmed or not
      def approved?
        !!self.approved_at
      end

      def skip_approval!
        self.approved_at = Time.now.utc
        @skip_approval = true
      end
      
      # Send approval instructions by email
      def send_approval_instructions
        unless @raw_approval_token
          generate_approval_token!
        end
        
        opts = { to: self.class.admin_email }
        send_devise_notification(:approval_instructions, @raw_approval_token, opts)
      end
      

      protected
        def approval_required?
          !@skip_approval
        end

        def generate_approval_token!
          generate_approval_token && save(validate: false)
        end

        def generate_approval_token
          raw, enc = Devise.token_generator.generate(self.class, :approval_token)
          @raw_approval_token   = raw
          self.approval_token   = enc
          self.approval_sent_at = Time.now.utc
        end

      module ClassMethods
        # Find a user by its approvable token and try to approve it.
        # If no user is found, returns a new user with an error.
        # If the user is already approved, create an error for the user
        # Options must have the approval_token
        def approve_by_token(approval_token)
          original_token     = approval_token
          approval_token = Devise.token_generator.digest(self, :approval_token, approval_token)

          approvable = find_or_initialize_with_error_by(:approval_token, approval_token)
          approvable.approve! if approvable.persisted?
          approvable.approval_token = original_token
          approvable
        end
              
        Devise::Models.config(self, :approver_class)
      end
    end
  end
end

# Devise.add_module :approvable, :model => 'approvable'