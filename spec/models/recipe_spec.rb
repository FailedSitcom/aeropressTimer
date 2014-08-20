require 'spec_helper'

describe Recipe do
  context "relationships" do
    it { should belong_to(:user) }
  end
end
