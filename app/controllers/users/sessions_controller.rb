class Users::SessionsController < Devise::SessionsController
# before_filter :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  def create

    if current_user
      if current_user.has_role? :admin
        puts 'Admin'
        redirect_to '/welcome/show'
      else if current_user.has_role? :stylist
        puts 'Stylist'
        redirect_to '/welcome/stylist_home'
      else if current_user.has_role? :client
        puts 'Client'

        if UserDetail.find_by_user_id(current_user)
          puts 'User Details Already Created!'
        else
            user_details  = UserDetail.create(user_id: current_user.id)
        end

        redirect_to '/welcome/client_home'
           else
             puts 'No roles'
             destroy;
             end
            end
      end
    else
      redirect_to '/users/sign_in'
    end

  end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # protected

  # You can put the params you want to permit in the empty array.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.for(:sign_in) << :attribute
  # end
end
