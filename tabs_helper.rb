module BootstrapComponentsHelpers
  module TabsHelper
    def tabs opts = {}
      opts[:direction] ||= 'above'
      opts[:style] ||= 'tabs'
      builder = TabsBuilder.new self
      yield builder
      tabs = content_tag(:ul, builder.pane_handles.join("\n").html_safe, :class => "nav nav-#{opts[:style]}")
      contents = content_tag(:div, builder.pane_contents.join("\n").html_safe, :class => 'tab-content')
      css_direction = "tabs-#{opts[:direction]}" unless opts[:direction] == 'above'
      content_tag :div, :class => "tabbable #{css_direction}" do
        if opts[:direction] == 'below'
          contents + tabs
        else
          tabs + contents
        end
      end
    end

    class TabsBuilder

      attr_reader :parent, :pane_contents, :pane_handles
      delegate :capture, :content_tag, :to => :parent

      def initialize parent
        @first = true
        @parent = parent
        @pane_handles = []
        @pane_contents = []
      end

      def pane title, &block
        css_class, @first = 'active', false if @first
        link = content_tag(:a, title, :'data-toggle' => 'tab', :href => "##{title.parameterize}_tab")
        @pane_handles << content_tag(:li, link, :class => css_class)
        @pane_contents << (content_tag :div, :class => "tab-pane #{css_class}", :id => "#{title.parameterize}_tab" do
          capture(&block)
        end)
        nil
      end

    end
    
  end
end

ActionView::Base.send :include, BootstrapComponentsHelpers::TabsHelper
