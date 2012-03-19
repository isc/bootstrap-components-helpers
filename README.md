# 

In your Gemfile:

    gem 'bootstrap-components-helpers', :git => 'git://gist.github.com/2117187.git'

In your views:
    
    = accordion do |accordion|
      = accordion.pane 'My first pane' do
        = render partial: 'my_first_pane'
      = accordion.pane 'My second pane' do
        = render partial: 'my_second_pane'

`accordion` method options :

  - `:accordion_id` : when you want more than one accordion on the same page
  - `:open` : when you want the first pane to be open on load