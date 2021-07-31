require 'openssl'

class HmacSignature
  def valid?(signature, message)
    signature == generate(message)
  end

  def generate(message)
    OpenSSL::HMAC.hexdigest(digest, secret, message.to_s)
  end

  private

  def digest
    OpenSSL::Digest::SHA256.new
  end

  def secret
    'secret'
  end
end

data = 'important_data_to_be_signed'
hmac = HmacSignature.new
signature = hmac.generate(data)
hmac.valid?(signature, data)
