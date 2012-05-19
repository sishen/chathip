class ChannelsController < ApplicationController
  def index
    @channels = Channel.all
    @channel = Channel.new
  end

  def show
    @channel = Channel.find_by_uuid(params[:id])
  end

  def create
    @channel = Channel.find_or_create_by_name(params[:channel][:name])
    if @channel
      redirect_to channel_path(@channel.uuid)
    end
  end
end
