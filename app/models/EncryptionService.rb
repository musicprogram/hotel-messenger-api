require 'openssl'

class EncryptionService
  def self.encrypt(data, key)
    cipher = OpenSSL::Cipher.new('AES-256-CBC')
    cipher.encrypt
    cipher.key = key
    iv = cipher.random_iv

    encrypted = cipher.update(data) + cipher.final

    { encrypted: encrypted, iv: iv }
  end

  def self.decrypt(encrypted_data, key, iv)
    decipher = OpenSSL::Cipher.new('AES-256-CBC')
    decipher.decrypt
    decipher.key = key
    decipher.iv = iv

    decrypted = decipher.update(encrypted_data) + decipher.final

    decrypted
  end
end
