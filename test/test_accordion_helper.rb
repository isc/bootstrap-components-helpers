require 'test_helper'

class AccordionHelperTest < ActionView::TestCase
  
  include BootstrapComponentsHelpers::AccordionHelper
  
  test "calling accordion method" do
    accordion do |accordion|
      accordion.pane 'My pane' do
        'inside the panee'
      end
    end
  end

end
