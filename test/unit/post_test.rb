require 'test_helper'

class PostTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  def test_truth
    assert true
  end

  def test_to_json
    post = Post.find_by_title('MyString')
    puts post.to_json
    puts post.to_ext_json
  end
end
