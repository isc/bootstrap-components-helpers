require 'test_helper'

class AccordionHelperTest < ActionView::TestCase
  
  include BootstrapComponentsHelpers::TabsHelper
  
  test "calling tabs method" do
    tabs do |tabs|
      tabs.pane 'My first pane' do
        'inside the pane'
      end
    end
  end

end
