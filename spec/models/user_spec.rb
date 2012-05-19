require 'spec_helper'

describe User do
  subject { create(:user) }

  it { should validate_presence_of :name }
  it { should validate_presence_of :github_uid }
  it { should validate_uniqueness_of :github_uid }
end
