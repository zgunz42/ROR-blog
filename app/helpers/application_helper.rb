module ApplicationHelper
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
end
