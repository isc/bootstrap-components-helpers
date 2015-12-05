module BootstrapComponentsHelpers
  module AccordionHelper
    def accordion opts = {}
      opts[:accordion_id] ||= 'accordion'
      builder = AccordionBuilder.new opts, self
      css_class = ['panel-group']
      css_class << opts[:class] if opts[:class].present?
      content_tag :div, :class => css_class, :id => opts[:accordion_id] do
        yield builder
      end
    end

    class AccordionBuilder

      attr_reader :parent
      delegate :capture, :content_tag, :link_to, :to => :parent

      def initialize opts, parent
        @parent = parent
        @opts = opts
      end

      def pane title, options = {}, &block
        css_class = options[:open] ? 'in' : ''
        content_tag :div, :class => 'panel panel-default' do
          heading = content_tag :div, :class => 'panel-heading' do
            content_tag :h4, :class => 'panel-title' do
              link_to title, "##{title.parameterize}_pane", :'data-toggle' => 'collapse',
            :'data-parent' => "##{@opts[:accordion_id]}"
            end
          end
          body = content_tag :div, :class => "panel-collapse collapse #{css_class}", :id => "#{title.parameterize}_pane" do
            content_tag :div, :class => 'panel-body' do
              capture(&block)
            end
          end
          heading + body
        end
      end
    end
  end
end

ActionView::Base.send :include, BootstrapComponentsHelpers::AccordionHelper
