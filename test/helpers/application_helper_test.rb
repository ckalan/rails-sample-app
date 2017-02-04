require 'test_helper'

class ApplicationHelperTest < ActionView::TestCase
  test "page title helper uses constant default title" do

    assert_equal page_title, ApplicationHelper::DefaultTitle

    assert_equal page_title("Help"), "Help | #{page_title}"

  end
end