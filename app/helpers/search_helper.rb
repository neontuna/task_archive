module SearchHelper
  def trim_and_highlight(text, search_term)
    preview_chars = 300
    search_term = sanitize(search_term)

    if index = text.index(search_term)
      trim = search_term.length + preview_chars
      start = index - trim >= 0 ? index - trim : 0
      if start <= 3
        result = "#{text[start..(index + trim)]}..."
      else
        result = "...#{text[start..(index + trim)]}..."
      end
    else
      result = "#{text[0..preview_chars]}..."
    end
    highlight(simple_format(result.html_safe), search_term)
  end
end
