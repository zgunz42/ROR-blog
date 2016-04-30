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
    unless options[:renderer]
      options = options.merge :renderer => PaginationListLinkRenderer
    end
    unless options[:page_links]
      options = options.merge  :page_links => false
    end
    unless options[:next_label]
      options = options.merge :next_label => "Next Page"
    end
    unless options[:previous_label]
      options = options.merge :previous_label => "Previous Page"
    end
    super *[collection_or_options, options].compact
  end

  # this add \n for each item and convert it into <br/>
  def wrap_br(text, options = {})
    # this is very long text with cool item on it
    line_width = options.fetch(:line_width, 24)
    line_height = options.fetch(:line_height, 4)

    text.split(/(.{#{line_width}})/).collect! do |line|
      line_height -=1
      line_height > 0 ? line.gsub(/(.{1,#{line_width}})(\s+|$)/, "\\1\n").strip : line
    end * "\n"
  end
end
