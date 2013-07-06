require 'test_helper'

class AccordionHelperTest < ActionView::TestCase

  include BootstrapComponentsHelpers::TabsHelper

  test "calling tabs method" do
    content = tabs do |tabs|
      tabs.pane 'My first pane<br>', id: 'custom_id', icon: 'ok', class: 'fade' do
        'inside the pane'
      end
      tabs.pane 'Empty pane' do
        ''
      end
    end
    assert_match /href="#custom_id"/, content
    assert_match /id="custom_id"/, content
    assert_match /class="icon-ok"/, content
    assert_match /class=".*fade.*"/, content
    refute_match /<br>/, content
    refute_match /Empty pane/, content
  end

end
