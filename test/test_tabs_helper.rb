require 'test_helper'

class TabsHelperTest < ActionView::TestCase
  include BootstrapComponentsHelpers::TabsHelper

  test "calling tabs method" do
    html = tabs do |tabs|
      tabs.pane 'My first pane' do
        'inside the pane'
      end
    end
    assert_helper_output 'tabs', html
  end

  test "extra options" do
    html = tabs do |tabs|
      tabs.pane 'My first pane<br>', id: 'custom_id', icon: 'fa fa-ok', class: 'custom-class' do
        'inside the pane'
      end
    end
    assert_match /href="#custom_id"/, html
    assert_match /id="custom_id"/, html
    assert_match /i class="fa fa-ok"/, html
    assert_match /class=".*custom-class.*"/, html
    refute_match /<br>/, html
  end

  test "adds 'in' css class to active tab with 'ade effect" do
    html = tabs do |tabs|
      tabs.pane 'My first pane', class: 'fade', active: true do
        'inside the pane'
      end
    end
    assert_match /class=".*active.*"/, html
    assert_match /class=".*in.*"/, html
  end

  test "empty pane does not included in html" do
    html = tabs do |tabs|
      tabs.pane 'Empty pane' do
        ''
      end
    end
    refute_match /Empty pane/, html
  end
end
