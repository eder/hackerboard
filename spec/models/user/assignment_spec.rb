require "spec_helper"

describe User, "assignment" do
  it "accepts whitelisted attributes" do
    expect {
      User.new(
        :name => "John",
        :email => "john@example.org",
        :password => "test",
        :password_confirmation => "test"
      )
    }.to_not raise_error
  end

  it "rejects blacklisted attributes" do
    expect {
      User.new(
        :password_hash => "test",
        :password_salt => "test"
      )
    }.to raise_error
  end
end
