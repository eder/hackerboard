require "spec_helper"

describe Mailer do
  describe "#welcome" do
    subject {
      Mailer.welcome(
        :email => "john@example.org",
        :url => "http://example.org",
        :name => "John Doe"
      )
    }

    its(:subject) { should eql(I18n.t("subjects.welcome")) }
    its(:to) { should include("john@example.org") }
    it { should be_multipart }

    it "sets text body" do
      body = subject.parts.first.body.to_s
      body.should have_content("http://example.org")
    end

    it "sets html body" do
      body = subject.parts.second.body.to_s
      body.should have_content("http://example.org")
    end
  end
end
