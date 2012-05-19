require 'spec_helper'

describe ChannelsController do

  describe "GET 'index'" do
    let(:channels) { [double('Channel'), double('Channel'), double('Channel')]}
    before do
      Channel.should_receive(:all).and_return(channels)
    end

    it "returns http success" do
      get 'index'
      response.should be_success
      assigns[:channels].should == channels
    end
  end

  describe "GET 'show'" do
    let(:channel) { double("Channel") }

    before do
      Channel.should_receive(:find_by_uuid).and_return(channel)
    end

    it "should show the channel" do
      get :show, id: "1234"
      response.should be_success
      assigns[:channel].should == channel
    end
  end

  describe "POST 'create'" do
    before do
      @channel = create(:channel, name: "Channel Test")
    end

    it "should create the channel" do
      expect {
        post 'create', channel: { name: "demo channel" }
        response.should be_redirect
      }.to change(Channel, :count).by(1)
    end

    it "should join the channel directly" do
      expect {
        post 'create', channel: { name: "Channel Test" }
        response.should redirect_to channel_path(@channel.uuid)
      }.to_not change(Channel, :count).by(1)
    end
  end

end
