module DateHelper
  def date_separater(items, item, index, block)
    prev_item = items[index - 1]
    if index > 0 && item.time && prev_item.time
      if item.time.to_date != prev_item.time.to_date
        if item.time.to_date == Date.current
          "<div class=\"#{block}__date-separater\">今日</div>".html_safe
        elsif item.time.to_date == Date.current.prev_day
          "<div class=\"#{block}__date-separater\">昨日</div>".html_safe
        else
          "<div class=\"#{block}__date-separater\">#{l item.time.to_date, format: :xshort}</div>".html_safe
        end
      end
    end
  end
end
