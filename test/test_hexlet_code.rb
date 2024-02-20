# frozen_string_literal: true

require "test_helper"

class TestHexletCode < Minitest::Test
  User = Struct.new(:name, :job, keyword_init: true)
  @user = User.new name: "rob"

  def test_that_it_has_a_version_number
    refute_nil ::HexletCode::VERSION
  end

  def test_it_does_something_useful
    assert true
  end

  def test_correct_tag_form_no_url
    assert_match(HexletCode.form_for(@user), "<form action=\"#\" method=\"post\"></form>")
  end

  def test_correct_tag_form_with_url
    assert_match(HexletCode.form_for(@user, url: "/users"), "<form action=\"/users\" method=\"post\"></form>")
  end
end
