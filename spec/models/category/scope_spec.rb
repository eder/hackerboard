require "spec_helper"

describe Category, "scope" do
  describe "sorted" do
    before do
      Category.delete_all

      @categories = [
        FactoryGirl.create(:category, :name => "B"),
        FactoryGirl.create(:category, :name => "C"),
        FactoryGirl.create(:category, :name => "A")
      ]
    end

    it "sorts categories" do
      Category.sorted.map(&:name).should eql(["A", "B", "C"])
    end
  end
end
