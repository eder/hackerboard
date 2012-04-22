require "spec_helper"

describe Comment, "validations" do
  subject { Comment.create }

  it "requires body" do
    subject.errors[:body].should_not be_empty
  end

  it "requires user" do
    subject.errors[:user].should_not be_empty
  end

  it "requires question" do
    subject.errors[:question].should_not be_empty
  end
end
