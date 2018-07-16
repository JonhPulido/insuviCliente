class SessionsController < Devise::SessionsController
	layout 'member'


def after_sign_up_path_for(resource)
     welcome_index_path
  end
end