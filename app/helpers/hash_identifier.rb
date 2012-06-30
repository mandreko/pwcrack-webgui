class HashIdentifier
  def self.identify(hash)
    return :md5 if hash.length == 32
    return :sha1 if hash.length == 40
    return :sha224 if hash.length == 56
    return :sha256 if hash.length == 64
    return :sha384 if hash.length == 96
    return :sha512 if hash.length == 128
    return :mysql3 if hash.length == 16
    return :mysql45 if hash.length == 41 && hash[0] == "*"
    return :unknown
  end
end