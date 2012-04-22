require "spec_helper"

describe Question, "validations" do
  subject { Question.create }

  it "requires title" do
    subject.errors[:title].should_not be_empty
  end

  it "requires body" do
    subject.errors[:body].should_not be_empty
  end

  it "requires user" do
    subject.errors[:user].should_not be_empty
  end

  it "requires category" do
    subject.errors[:category].should_not be_empty
  end
end
