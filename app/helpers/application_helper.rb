module ApplicationHelper
  class HTMLwithPygments < Redcarpet::Render::HTML
    def block_code(code, language)
      Pygments.highlight(code, lexer: language)
    end
  end
  class PaginationListLinkRenderer < WillPaginate::ActionView::LinkRenderer
    ELLIPSIS = "&hellip;"

    def to_html
      list_items = pagination.map do |item|
        case item
          when Fixnum
            page_number(item)
          else
            send(item)
        end
      end.join(@options[:link_separator])

      tag("ul", list_items, class: ul_class)
    end

    def container_attributes
      super.except(*[:link_options])
    end

    protected

    def page_number(page)
      link_options = @options[:link_options] || {}

      if page == current_page
        tag("li", tag("a", page), class: "active")
      else
        tag("li", link(page, page, link_options.merge(rel: rel_value(page))))
      end
    end

    def previous_or_next_page(page, text, status)
      link_options = @options[:link_options] || {}

      if page
        link_options = link_options.merge :class => 'button big %s' % status
        tag("li", link(text, page, link_options))
      else
        tag("li", tag("a", text, class: 'disabled button big %s' % status))
      end
    end

    def gap
      tag("li", tag("a", ELLIPSIS), class: "disabled")
    end

    def previous_page
      num = @collection.current_page > 1 && @collection.current_page - 1
      previous_or_next_page(num, @options[:previous_label], "previous")
    end

    def next_page
      num = @collection.current_page < @collection.total_pages && @collection.current_page + 1
      previous_or_next_page(num, @options[:next_label], "next")
    end

    def ul_class
      ["actions", @options[:class]].compact.join(" ")
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

  # change the default link renderer for will_paginate
  def will_paginate(collection_or_options = nil, options = {})
    if collection_or_options.is_a? Hash
      options, collection_or_options = collection_or_options, nil
      end
    options = options.merge :next_label => "Next Page"
    options = options.merge :previous_label => "Previous Page"
    unless options[:renderer]
      options = options.merge :renderer => PaginationListLinkRenderer
    end
    unless options[:page_links]
      options = options.merge  :page_links => false
    end
    super *[collection_or_options, options].compact
  end
end
