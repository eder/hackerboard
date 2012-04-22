require "spec_helper"

describe Question, "assignment" do
  it "accepts whitelisted attributes" do
    expect {
      Question.new(
        :title => "Some title",
        :body => "Some body",
        :category_id => 1
      )
    }.to_not raise_error
  end

  it "rejects blacklisted attributes" do
    expect {
      Question.new(
        :user_id => 1234
      )
    }.to raise_error
  end
end
