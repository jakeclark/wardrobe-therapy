class UserDetailsController < ApplicationController
  before_action :authenticate_user!,:set_user_detail, only: [:show, :edit, :update, :destroy]
  respond_to :html, :xml, :json

  def index
    @user_details = UserDetail.all
    respond_with(@user_details)
  end

  def show
    respond_with(@user_detail)
  end

  def new
    @user_detail = UserDetail.new
    respond_with(@user_detail)
  end

  def edit

    puts 'Editing...'
    #if(!params[:user_detailsID].nil?)
     # puts params[:user_detailsID]
      #@user_detail = UserDetail.find_by_user_id(params[:user_detailsID])
      #respond_with(@user_detail)
    #end
  end

  def create
    @user_detail = UserDetail.new(user_detail_params)
    @user_detail.save
    respond_with(@user_detail)
  end

  def update
    @user_detail.update(user_detail_params)
    respond_with(@user_detail)
  end

  def destroy
    @user_detail.destroy
    respond_with(@user_detail)
  end

  private
    def set_user_detail

      if current_user.has_role? :admin
        puts 'I am a admin...'
        @user_detail = UserDetail.find(params[:id])
      elsif current_user.has_role? :stylist
        puts 'I am a stylist...'
        @user_detail = UserDetail.find(params[:id])
      else

        @user_detail  = UserDetail.find_by_user_id(current_user.id)
      end
      # @user_detail = UserDetail.find(params[:id])
      #@user_detail  = UserDetail.find_by_user_id(current_user.id)
    end

    def user_detail_params
      #params.require(:user_detail).permit(:user_id)
      params.require(:user_detail).permit!
    end
end
