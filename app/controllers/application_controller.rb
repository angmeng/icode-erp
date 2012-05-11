class ApplicationController < ActionController::Base
  protect_from_forgery
  
  
#  To verify if a user is signed in, use the following helper:
#
#  user_signed_in?
#  For the current signed-in user, this helper is available:
#
#  current_user
#  You can access the session for this scope:
#
#  user_session
#  After signing in a user, confirming the account or updating the password, Devise will look for a scoped root path to redirect. Example: For a :user resource, it will use +user_root_path+ if it exists, otherwise default +root_path+ will be used. This means that you need to set the root inside your routes:
#
#  root :to => "home#index"
#  You can also overwrite +after_sign_in_path_for+ and +after_sign_out_path_for+ to customize your redirect hooks.
#  Notice that if your devise model is not called "user" but "member", then the helpers you should use are:
#
#  before_filter :authenticate_member!
#
#  member_signed_in?
#
#  current_member
#
#  member_session
end
