module DeviseHelper
  def devise_error_messages!
    return "" if resource.errors.empty?

    messages = resource.errors.messages.map { |attr,msg| content_tag(:li, msg.join(', ')) }.join

    html = <<-HTML
    <div id="error_explanation">
      <h2>#{t(:take_a_look_on_errors)}:</h2>
      <ul>#{messages}</ul>
    </div>
    HTML

    html.html_safe
  end

  def devise_error_messages?
    resource.errors.empty? ? false : true
  end

end