require "spec_helper"

describe ApplicationHelper do
  describe "#display_current_user_name" do
    context "when logged" do
      it "returns name" do
        helper.stub :logged_in? => true, :current_user => mock(:name => "John Doe")
        helper.display_current_user_name.should have_content("John Doe")
      end
    end

    context "when unlogged" do
      it "returns nil" do
        helper.stub :logged_in? => false
        helper.display_current_user_name.should be_nil
      end
    end
  end
end
