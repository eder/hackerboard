class SHA1Encryptor
  def self.encrypt(value)
    Digest::SHA1.hexdigest(value)
  end
end
