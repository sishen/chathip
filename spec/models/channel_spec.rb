require 'spec_helper'

describe Channel do
  subject { create(:channel) }

  it { should validate_presence_of :name }
  it { should validate_uniqueness_of :name }
end
