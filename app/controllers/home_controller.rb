class HomeController < ApplicationController

  def splash
  end

  def index
    @release = Release.current
    @next = @release.next
    @previous = @release.previous
  end

  def secret_key_entrance
    redirect_to beta_path
  end

end
