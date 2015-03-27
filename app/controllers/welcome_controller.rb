class WelcomeController < ApplicationController
  before_action :authenticate_user!
  def show
    puts 'Welcome Method';
    #check here if its going to redirect to the right screen
    # redirect_to '/welcome/stylist_home'

    @follow = Follow.new
    if current_user.has_role? :stylist
        puts 'Stylist, redirect'
        redirect_to '/welcome/stylist_home'
    else if current_user.has_role? :client
           puts 'Client, redirect'
           redirect_to '/welcome/client_home'

      end
    end




  end

  def stylist_home
    puts 'Welcome Stylist';
  end

  def client_home
    puts 'Welcome Stylist';

  end

end
