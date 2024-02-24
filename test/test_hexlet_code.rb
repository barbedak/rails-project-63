# frozen_string_literal: true

require "test_helper"

class TestHexletCode < Minitest::Test
  User = Struct.new(:name, :job, :gender, keyword_init: true)
  @user = User.new name: "rob", job: "hexlet", gender: "m"

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

  def test_correct_tag_for_with_block
    user = User.new name: "rob", job: "hexlet", gender: "m"
    result = HexletCode.form_for(user) do |f|
      f.input :name, class: "user-input"
      f.input :job, as: :text, rows: 50, cols: 50
      f.submit "Wow"
    end
    expected = "<form action=\"#\" method=\"post\"><label for=\"name\">Name</label>"
    expected += "<input name=\"name\" type=\"text\" value=\"rob\" class=\"user-input\">"
    expected += "<textarea name=\"job\" cols=\"50\" rows=\"50\">hexlet</textarea><input type=\"submit\" value=\"Wow\"></form>" # rubocop:disable Layout/LineLength
    assert_match(expected, result)
  end
end
