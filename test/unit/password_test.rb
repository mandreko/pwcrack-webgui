require 'test_helper'
 
class PasswordTest < ActiveSupport::TestCase
  
  test "initialize can create a proper Password" do
    line = "5f4dcc3b5aa765d61d8327deb882cf99:abc123"
    leak_id = "123"
    
    password = Password.parse(leak_id, line)
    
    assert_equal password.leak_id, leak_id
    assert_equal password.pwhash, "5f4dcc3b5aa765d61d8327deb882cf99"
    assert_equal password.salt, "abc123"
    assert_equal password.hash_type, :md5
    assert_equal password.cleartext, nil
  end
  
end