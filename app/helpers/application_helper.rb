module ApplicationHelper
  class HTMLwithPygments < Redcarpet::Render::HTML
    def block_code(code, language)
      Pygments.highlight(code, lexer: language)
    end
  end
  def part(content)
    max_char = 114
    pattern = /\b([A-Za-z-_,. ]+)\b/
    data = ''
    content.scan(pattern).each do |m|
      if max_char <= 0
        break
      end
      max_char -= m[0].length
      data += m[0]
    end

    data << "..."
  end

  def markdown(content)
    render = HTMLwithPygments.new(no_links: true, hard_wrap: true)
    options = {
        autolink: true,
        no_intra_emphasis: true,
        disable_indented_code_blocks: true,
        fenced_code_blocks: true,
        strikethrough: true,
        superscrip: true,
        lax_spacing: true,
    }
    Redcarpet::Markdown.new(render, options).render(content).html_safe
  end
end
