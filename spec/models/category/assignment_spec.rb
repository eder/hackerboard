require "spec_helper"

describe Category, "assignment" do
  it "accepts whitelisted attributes" do
    expect {
      Category.new(:name => "Some category")
    }.to_not raise_error
  end
end
