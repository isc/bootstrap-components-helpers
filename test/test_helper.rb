require 'test/unit'
require 'action_view'
require 'action_view/template'
require 'bootstrap-components-helpers'

class ActionView::TestCase

  def assert_helper_output fixture_name, actual_output
    assert_equal File.read("#{File.dirname __FILE__}/fixtures/#{fixture_name}.html").strip, actual_output
  end

end
