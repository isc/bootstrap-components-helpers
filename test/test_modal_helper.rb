require 'test_helper'

class ModalHelperTest < ActionView::TestCase
  include BootstrapComponentsHelpers::ModalHelper

  test 'modal method' do
    html = modal 'My modal title' do |modal|
      modal.body do
        'inside the modal body'
      end
    end
    assert_helper_output 'modal', html
  end
end
