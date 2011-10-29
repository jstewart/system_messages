module JMS
  module Helpers
    module SystemMessageHelper
      def system_msg(message, options={})
        header = header_div(message.header, message.level)
        body = message.message
        base_options = {:class => "system-message #{message.level}", :id => "system_message_#{message.id}"}.merge(options)

        if message.dismissable?
          body += content_tag(:p, link_to_remote("Dismiss", :url => {:controller => 'system_messages', :action => 'dismiss',
            :id => message.id}))
        end
        content_tag(:div, header + body, base_options)
      end

      def system_messages_for(obj, options={})
        messages = obj.system_messages.select(&:viewable?).
        map {|msg| system_msg(msg, options)}

        messages.join("\n")
      end

      def system_messages(options={})
        SystemMessage.global.viewable.map {|msg| system_msg(msg, options)}.join("\n")
      end

      def static_system_message(level, header, options={}, &block)
        header = header_div(header, level)
        body   = capture(&block)

        concat(content_tag(:div, header + body,
              {:class => "system-message #{level}"}.merge(options)),
              block.binding)
      end

      private

      def header_div(text, level)
        content_tag(:div, content_tag(:span, text, :class => level), :class => "system-message-header #{level}")
      end

    end
  end
end