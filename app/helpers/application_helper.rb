module ApplicationHelper

  # returns full title on per-page basis
  def full_title( page_title )
    base_title = 'New App'
    if page_title.empty?
      base_title
    else
      "#{base_title} | #{page_title}"
    end
  end
end
