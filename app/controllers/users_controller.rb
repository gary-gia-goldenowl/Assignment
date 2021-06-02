class UsersController < Devise::SessionsController
  skip_before_action :direct_admin
end
