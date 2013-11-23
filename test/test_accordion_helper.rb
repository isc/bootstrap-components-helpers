require 'test_helper'

class AccordionHelperTest < ActionView::TestCase

  include BootstrapComponentsHelpers::AccordionHelper

  test "accordion method" do
    html = accordion do |accordion|
      accordion.pane 'My pane' do
        'inside the pane'
      end
    end
    assert_helper_output 'accordion', html
  end

end
