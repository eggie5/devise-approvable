class Devise::ApprovalsController < DeviseController
  # GET /resource/confirmation?confirmation_token=abcdef
  def show
    self.resource = resource_class.approve_by_token(params[:approval_token])
    yield resource if block_given?

    if resource.errors.empty?
      set_flash_message(:notice, :approved) if is_flashing_format?
      respond_with_navigational(resource){ redirect_to after_approval_path_for(resource_name, resource) }
    else
      respond_with_navigational(resource.errors, status: :unprocessable_entity){ render :new }
    end
  end
end