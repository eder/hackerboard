require "spec_helper"

describe Comment, "assignment" do
  it "accepts whitelisted attributes" do
    expect {
      Comment.new(:body => "Some comment")
    }.to_not raise_error
  end
end
