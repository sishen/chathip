class HomeController < ApplicationController
  def index
    @channels = Channel.all
    @channel = Channel.new
  end
end
