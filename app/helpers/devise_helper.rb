module DeviseHelper
  def devise_error_messages!
    return '' if resource.errors.empty?
    id = 0
    logger.debug resource.errors.full_messages.to_s
    messages = resource.errors.full_messages.map { |key, msg| generate_content msg, key, ++id }.join

    html = <<-HTML
    <section id="notifications">
          #{messages}
    </section>
    HTML

    html.html_safe
  end
  private
  def generate_content(message, status, id)
    html = <<-HTML
        <div id="notif-#{id}" class="content">
            <p class="message">#{message}</p>
            <span class="status #{status}"></span>
        </div>
    HTML
    html.html_safe
  end
end