require "spec_helper"

describe Authenticator do
  context "with valid credentials" do
    let(:user) {
      mock("user", :password_salt => "salt", :password_hash => "hash")
    }

    before do
      User.should_receive(:find_by_email).with("john@example.org").and_return(user)
      PasswordEncryptor.should_receive(:hash_for).with("salt", "test").and_return("hash")
    end

    # let!(:user) do
    #   User.create!({
    #     :name => "John Doe",
    #     :email => "john@example.org",
    #     :password => "test",
    #     :password_confirmation => "test"
    #   })
    # end

    it "returns user" do
      Authenticator.authenticate("john@example.org", "test").should eql(user)
    end
  end
end
