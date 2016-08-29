module RenderHelper
  def markdown(text)
    render = Redcarpet::Render::HTML.new(hard_wrap: true, filter_html: true)
    markdown_options = { autolink: true, no_intra_emphasis: true, tables: true }
    markdown = Redcarpet::Markdown.new(render, markdown_options)
    markdown.render(text).html_safe
  end
end
