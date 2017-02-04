module ApplicationHelper

  DefaultTitle = "Ruby on Rails Tutorial Sample App"

  def page_title(title="")
     (title.empty? ? "" : (title + " | ") ) + DefaultTitle
  end

end
