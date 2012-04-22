require "spec_helper"

describe QuestionList do
  context "without questions" do
    let(:questions) { mock("questions", :all => []) }
    subject { QuestionList.new(questions) }

    it "returns no questions partial" do
      subject.to_partial.should eql("questions/no_questions")
    end
  end

  context "with questions" do
    let(:questions) { mock("questions", :all => [1,2,3]) }
    subject { QuestionList.new(questions) }

    it "returns questions" do
      subject.to_partial.should eql("questions/questions")
    end
  end
end
