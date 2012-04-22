require "spec_helper"

describe PasswordEncryptor do
  it "generates salt" do
    PasswordEncryptor.stub :rand => "salt"
    PasswordEncryptor::Engine.should_receive(:encrypt).with("salt").and_return("salt")
    PasswordEncryptor::Engine.should_receive(:encrypt).with("--salt--test--").and_return("hash")

    PasswordEncryptor.encrypt("test").should eql(["salt", "hash"])
  end
end
