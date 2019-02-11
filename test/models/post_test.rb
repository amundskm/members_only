require 'test_helper'

class PostTest < ActiveSupport::TestCase

  def setup
    @user = users(:michael)

    @post = @user.posts.build(content: "We the People of the United States, in Order to
      form a more perfect Union, establish Justice, insure domestic Tranquility,
       provide for the common defense, promote the general Welfare, and secure
       the Blessings of Liberty to ourselves and our Posterity, do ordain and
         establish this Constitution for the United States of America.")
  end

  test "should be valid" do
    assert @post.valid?
  end

  test "post should be present" do
    @post.content = "      "
    assert_not @post.valid?
  end

  test "content should not be too long" do
    @post.content = "a" * 501
    assert_not @post.valid?
  end

end
