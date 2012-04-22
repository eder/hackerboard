require "spec_helper"

describe User, "validations" do
  subject { User.create }

  it "requires name" do
    subject.errors[:name].should_not be_empty
  end

  it "requires valid email" do
    subject.email = "invalid"
    subject.valid?
    subject.errors[:email].should_not be_empty
  end

  it "accepts valid email" do
    subject.email = "doe@example.org"
    subject.valid?
    subject.errors[:email].should be_empty
  end

  it "requires password" do
    subject.errors[:password].should_not be_empty
  end

  it "requires password confirmation" do
    subject.password = "pass"
    subject.password_confirmation = "test"
    subject.valid?
    subject.errors[:password].should_not be_empty
  end

  it "rejects existing email" do
    subject.email = users(:john).email
    subject.valid?
    subject.errors[:email].should_not be_empty
  end
end
