require "spec_helper"

describe SHA1Encryptor do
  it_behaves_like "encryptor adapter"

  it "delegates to Digest::SHA1" do
    Digest::SHA1.should_receive(:hexdigest).with("test")
    SHA1Encryptor.encrypt("test")
  end
end
