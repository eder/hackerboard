class Authenticator
  def self.authenticate(email, password)
    user = User.find_by_email(email)

    return unless user

    actual_hash = PasswordEncryptor.hash_for(user.password_salt, password)

    if user.password_hash == actual_hash
      user
    else
      nil
    end
  end
end
