class HomeController < ApplicationController

  before_action :validate_session, only: [:secret_key_entrance, :index]

  def splash
  end

  def index
    @release = Release.current
  end

  def secret_key_entrance
    redirect_to test_path
  end

end
