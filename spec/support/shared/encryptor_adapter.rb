shared_examples_for "encryptor adapter" do
  it "responds to encrypt method" do
    described_class.should respond_to(:encrypt)
  end
end
