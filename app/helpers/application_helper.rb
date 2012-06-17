module ApplicationHelper

  # returns full title on per-page basis
  def full_title( page_title )
    base_title = 'HRVA'
    if page_title.empty?
      base_title
    else
      "#{base_title} | #{page_title}"
    end
  end

  #convert plain links into HTML anchor links (with <a> tags) 
  #return the string back
  #uses String's gsub method for regular expression
  def display_content_with_links(text)
    text.gsub(/(http(|s):\/\/[a-zA-Z0-9\/\.\+\-_:?&=]+)/) {|a| "<a href=\"#{a}\" target='_blank'>#{a}</a>"}
  end

  def display_your_area(text)
    text.gsub( /your area/, "#{current_user.city}" )
  end
end
