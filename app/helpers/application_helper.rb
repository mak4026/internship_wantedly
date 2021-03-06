module ApplicationHelper
  def bootstrap_devise_error_messages!
    return '' if resource.errors.empty?

    messages = resource.errors.full_messages.map { |msg| content_tag(:li, msg) }.join
    sentence = I18n.t('errors.messages.not_saved',
    count: resource.errors.count,
    resource: resource.class.model_name.human.downcase)

    html = <<-HTML
    <div class="alert alert-danger alert-block">
      <button type="button" class="close" data-dismiss="alert">x</button>
      <h5>#{sentence}</h5>
      #{messages}
    </div>
    HTML

    html.html_safe
  end
  
  # ページごとの完全なタイトルを返す
  def full_title(page_title = '')
    base_title = "インターンシップ課題プログラム"
    if page_title.empty?
      base_title
    else
      page_title + " | " + base_title
    end
  end
end
