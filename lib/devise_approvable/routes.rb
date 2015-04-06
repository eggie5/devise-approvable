module ActionDispatch::Routing
  class Mapper

  protected
    def devise_approval(mapping, controllers) 
      resource :approval, only: [:new, :create, :show], path: mapping.path_names[:approval], controller: controllers[:approvals]
    end

  end