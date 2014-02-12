class UsersController < ApplicationController
  before_filter :authenticate_user!, except: [:show]

  def settings
  end

  def show
  end

  private
end
