require 'test_helper'
 
class HashIdentifierTest < ActiveSupport::TestCase
  test "md5 hash is correctly identified" do
    hash = "5f4dcc3b5aa765d61d8327deb882cf99"
    hash_type = HashIdentifier.identify(hash)
    assert_equal(hash_type, :md5)
  end
  
  test "sha1 hash is correctly identified" do
    hash = "5baa61e4c9b93f3f0682250b6cf8331b7ee68fd8"
    hash_type = HashIdentifier.identify(hash)
    assert_equal(hash_type, :sha1)
  end
  
  test "sha224 hash is correctly identified" do
    hash = "d63dc919e201d7bc4c825630d2cf25fdc93d4b2f0d46706d29038d01"
    hash_type = HashIdentifier.identify(hash)
    assert_equal(hash_type, :sha224)
  end
  
  test "sha256 hash is correctly identified" do
    hash = "5e884898da28047151d0e56f8dc6292773603d0d6aabbdd62a11ef721d1542d8"
    hash_type = HashIdentifier.identify(hash)
    assert_equal(hash_type, :sha256)
  end
  
  test "sha384 hash is correctly identified" do
    hash = "a8b64babd0aca91a59bdbb7761b421d4f2bb38280d3a75ba0f21f2bebc45583d446c598660c94ce680c47d19c30783a7"
    hash_type = HashIdentifier.identify(hash)
    assert_equal(hash_type, :sha384)
  end
  
  test "sha512 hash is correctly identified" do
    hash = "b109f3bbbc244eb82441917ed06d618b9008dd09b3befd1b5e07394c706a8bb980b1d7785e5976ec049b46df5f1326af5a2ea6d103fd07c95385ffab0cacbc86"
    hash_type = HashIdentifier.identify(hash)
    assert_equal(hash_type, :sha512)
  end
  
  test "mysql3 hash is correctly identified" do
    hash = "5d2e19393cc5ef67"
    hash_type = HashIdentifier.identify(hash)
    assert_equal(hash_type, :mysql3)
  end
  
  test "mysql4_5 hash is correctly identified" do
    hash = "*2470c0c06dee42fd1618bb99005adca2ec9d1e19"
    hash_type = HashIdentifier.identify(hash)
    assert_equal(hash_type, :mysql45)
  end
  
end