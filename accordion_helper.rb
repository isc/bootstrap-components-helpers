module BootstrapComponentsHelpers
  module AccordionHelper
    def accordion opts = {}
      opts[:accordion_id] ||= 'accordion'
      builder = AccordionBuilder.new opts, self
      content_tag :div, :class => 'accordion', :id => opts[:accordion_id] do
        yield builder
      end
    end

    class AccordionBuilder

      attr_reader :parent
      delegate :capture, :content_tag, :link_to, :to => :parent

      def initialize opts, parent
        @first = true
        @parent = parent
        @opts = opts
      end

      def pane title, &block
        css_class =  (@first && @opts[:open]) ? 'in' : ''
        @first = false
        content_tag :div, :class => 'accordion-group' do
          heading = content_tag :div, :class => 'accordion-heading' do
            link_to title, "##{title.parameterize}_pane", :class => 'accordion-toggle', :'data-toggle' => 'collapse',
            :'data-parent' => "##{@opts[:accordion_id]}"
          end
          body = content_tag :div, :class => "accordion-body collapse #{css_class}", :id => "#{title.parameterize}_pane" do
            content_tag :div, :class => 'accordion-inner' do
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
