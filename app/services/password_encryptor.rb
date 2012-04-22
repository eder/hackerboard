class PasswordEncryptor
  Engine = SHA1Encryptor

  def self.encrypt(password)
    salt = Engine.encrypt(rand.to_s)
    hash = hash_for(salt, password)

    [salt, hash]
  end

  def self.hash_for(salt, password)
    Engine.encrypt("--#{salt}--#{password}--")
  end
end
