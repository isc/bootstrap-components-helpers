module BootstrapComponentsHelpers
  module TabsHelper
    def tabs opts = {}
      opts[:style] ||= 'tabs'
      builder = TabsBuilder.new self
      yield builder
      pane_handles_html = builder.pane_handles_html
      return unless pane_handles_html
      tabs = content_tag(:ul, builder.pane_handles_html, :class => "nav nav-#{opts[:style]}")
      contents = content_tag(:div, builder.pane_contents_html, :class => 'tab-content')
      content_tag :div do
        tabs + contents
      end
    end

    class TabsBuilder
      include ActionView::Helpers::OutputSafetyHelper

      attr_reader :parent, :pane_contents, :pane_handles
      delegate :capture, :content_tag, :to => :parent

      def initialize parent
        @parent = parent
        @pane_handles = []
        @pane_contents = []
      end

      def pane title, options = {}, &block
        css_class = options[:active] ? 'active' : ''
        tab_id = options[:id] || default_tab_id(title)
        link = content_tag(:a, :'data-toggle' => 'tab', :href => "##{tab_id}") do
          if options[:icon]
            title = raw(content_tag(:i, '', class: "#{options[:icon]}") + ' ' + title)
          end
          title
        end
        content = capture(&block)
        if content.present?
          @pane_handles << [link, css_class]
          @pane_contents << [[css_class, options[:class]], title, tab_id, content]
        end
        nil
      end

      def pane_handles_html
        return if pane_handles.empty?
        pane_handles.first[1] = 'active' unless pane_handles.detect {|ph| ph[1] == 'active'}
        pane_handles.map do |link, css_class|
          content_tag(:li, link, :class => css_class)
        end.join("\n").html_safe
      end

      def pane_contents_html
        return if pane_contents.empty?
        pane_contents.first[0] << 'active' unless pane_contents.detect {|pc| pc[0].include? 'active'}
        pane_contents.map do |css_class, title, tab_id, content|
          css_class << 'in' if css_class.include?('active') && css_class.include?('fade')
          css_class = css_class.join(' ').strip
          content_tag :div, content, :class => "tab-pane #{css_class}", :id => "#{tab_id}"
        end.join("\n").html_safe
      end

      private

      def default_tab_id(title)
        title.parameterize + '_tab'
      end

    end

  end
end

ActionView::Base.send :include, BootstrapComponentsHelpers::TabsHelper
