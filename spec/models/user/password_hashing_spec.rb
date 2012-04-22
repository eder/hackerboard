require "spec_helper"

describe User, "password hashing" do
  subject { User.new(:password => "test") }

  before do
    PasswordEncryptor.should_receive(:encrypt).with("test").and_return(["salt", "hash"])
  end

  it "sets password salt" do
    subject.password_salt.should eql("salt")
  end

  it "sets password hash" do
    subject.password_hash.should eql("hash")
  end

  it "sets password" do
    subject.password.should eql("test")
  end
end
