require "spec_helper"

describe Category, "validations" do
  subject { Category.create }

  it "requires name" do
    subject.errors[:name].should_not be_empty
  end
end
