module BootstrapComponentsHelpers
  module TabsHelper
    def tabs opts = {}
      opts[:direction] ||= 'above'
      opts[:style] ||= 'tabs'
      builder = TabsBuilder.new self
      yield builder
      tabs = content_tag(:ul, builder.pane_handles_html, :class => "nav nav-#{opts[:style]}")
      contents = content_tag(:div, builder.pane_contents_html, :class => 'tab-content')
      css_direction = "tabs-#{opts[:direction]}" unless opts[:direction] == 'above'
      content_tag :div, :class => "tabbable #{css_direction}" do
        opts[:direction] == 'below' ? (contents + tabs) : (tabs + contents)
      end
    end

    class TabsBuilder

      attr_reader :parent, :pane_contents, :pane_handles
      delegate :capture, :content_tag, :to => :parent

      def initialize parent
        @parent = parent
        @pane_handles = []
        @pane_contents = []
      end

      def pane title, options = {}, &block
        css_class = options[:active] ? 'active' : ''
        link = content_tag(:a, title, :'data-toggle' => 'tab', :href => "##{title.parameterize}_tab")
        @pane_handles << [link, css_class]
        @pane_contents << [css_class, title, capture(&block)]
        nil
      end
      
      def pane_handles_html
        pane_handles.first[1] = 'active' unless pane_handles.detect {|ph| ph[1] == 'active'}
        pane_handles.map do |link, css_class|
          content_tag(:li, link, :class => css_class)
        end.join("\n").html_safe
      end
      
      def pane_contents_html
        pane_contents.first[0] = 'active' unless pane_contents.detect {|pc| pc[0] == 'active'}
        pane_contents.map do |css_class, title, content|
          content_tag :div, content, :class => "tab-pane #{css_class}", :id => "#{title.parameterize}_tab"
        end.join("\n").html_safe
      end

    end
    
  end
end

ActionView::Base.send :include, BootstrapComponentsHelpers::TabsHelper
