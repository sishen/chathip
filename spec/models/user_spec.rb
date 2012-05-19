require 'spec_helper'

describe User do
  subject { create(:user) }

  it { should validate_presence_of :name }
  it { should validate_presence_of :github_uid }
  it { should validate_uniqueness_of :github_uid }

  describe ".create_with_omniauth" do
    let(:full_auth) {
      {
        'uid'  => '12345',
        'info' => { 'name' => "dingding" }
      }
    }

    let(:partial_auth) {
      {
        'uid' => '12345'
      }
    }

    it "should create the user" do
      expect {
        User.create_with_omniauth(full_auth)
      }.to change(User, :count).by(1)
    end

    it "should not create the user" do
      expect {
        User.create_with_omniauth(partial_auth)
      }.to raise_error
    end
  end
end
