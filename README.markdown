## Twitter Bootstrap Components Helper

Provides view helpers for **accordion**, **tabs** and **modal** Twitter Bootstrap components.

In your Gemfile:

    gem 'bootstrap-components-helpers'

### Accordion helper:
    
    = accordion do |accordion|
      = accordion.pane 'My first pane' do
        = render partial: 'my_first_pane'
      = accordion.pane 'My second pane' do
        = render partial: 'my_second_pane'

`accordion` method options :

  - `:accordion_id` : when you want more than one accordion on the same page.
  - `:class` : to add an additional CSS class to the container DIV.

`pane` method options :

  - `:open` : when you want that pane to be open on load.
  
### Tabs helper:

    = tabs do |tabs|
      - tabs.pane 'My first pane' do
        = render partial: 'my_first_pane'
      - tabs.pane 'My second pane' do
        = render partial: 'my_second_pane'
        
`tabs` method options :

  - `:direction` : to control the positioning of the tabs. Valid values are `below`, `left`, `right` and `above` (default is `above`).
  - `:style` : `tabs` or `pills` (default is `tabs`).

`pane` method options :

  - `:active` : when you want that pane to be active on load.

### Modal helper:

    = modal 'My modal title' do |modal|
      - modal.body do
        Inside the modal

`modal` method options :

  - `:skip_footer` : when you don't want a footer at all for your modal.

### Contributors

  - Graham Torn
  - Caleb Adam Haye
  - Darkside73
  - Dave Burt
