class FollowsController < ApplicationController

  def follow
    #@user = User.find(params[:id])
    #current_user.follow(@user)
    @user_details = UserDetail.find(params[:id])
    @user = User.find( @user_details.user_id )
    current_user.follow(@user);
  end

  def unfollow
    #@user = User.find(params[:user_id])
    @user_details = UserDetail.find(params[:id])
    @user = User.find( @user_details.user_id )
    current_user.stop_following(@user)
  end


  def list_clients
  #The records that an user (Stylist) is following (Clients)
  end


  def list_stylists
   #Number of followers of a user (Client) by different stylists
  end

  def create
    puts 'Create link between users...'

    if !params["client_id"].empty? && !params["stylist_id"].empty?

      @client_user = User.find( params["client_id"] )
      @stylist_user = User.find( params["stylist_id"] )

      @client_user.follow(@stylist_user);

    end

    redirect_to '/welcome/show'

  end

end