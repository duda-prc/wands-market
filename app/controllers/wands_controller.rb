class WandsController < ApplicationController

  def new
    @wand = Wand.new
    @user = User.find(params[:user_id])
  end
end
