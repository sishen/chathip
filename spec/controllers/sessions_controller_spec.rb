require 'spec_helper'

describe SessionsController do
  describe "#new" do
    it "should redirect to /auth/github" do
      get :new
      response.should redirect_to('/auth/github')
    end
  end

  describe "#create" do
    context "#has user" do
      before do
        @user = double("User", id: "12", github_uid: "12345")
        @auth = { 'uid' => @user.github_uid }
        controller.stub(:auth).and_return(@auth)
        User.stub_chain(:where, :first).and_return(@user)
      end

      it "should login in " do
        expect {
          post :create
          session[:user_id].should == @user.id
          response.should redirect_to root_url
          flash[:notice].should_not be_blank
        }.to_not change(User, :count).by(1)
      end
    end

    context "#new user" do
      before do
        @auth = { 'uid' => '1234', 'info' => { 'name' => 'dingding' } }
        controller.stub(:auth).and_return(@auth)
        User.stub_chain(:where, :first).and_return(false)
        @user = double("User", id: "23")
        User.should_receive(:create_with_omniauth).with(@auth).and_return(@user)
      end

      it "should create the user" do
        post :create
        session[:user_id].should == "23"
        response.should redirect_to root_url
        flash[:notice].should_not be_blank
      end
    end
  end

  describe "#destroy" do
  end
end
