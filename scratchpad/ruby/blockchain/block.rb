class Block
  attr_accessor :number, :nonce, :data, :previous

  def initialize
    # has hmac, and data
    # nonce should be found to match hmac
  end

  def mine
    # loop over numbers to find correct nonce
  end

  def valid?
    # check if signature matches
  end
end
