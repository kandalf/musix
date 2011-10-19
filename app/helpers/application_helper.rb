module ApplicationHelper
  def format_messages(messages, title = nil)
    html = title.nil? ? "" : "<h4>#{title}</h4>"
    if messages.is_a? Array
      html << "<ul class='errors'>"
      messages.each do |msg|
        html << "<li>#{msg}</li>"
      end
      html << "</ul>"
    else
      html << messages
    end

    html
  end
end
