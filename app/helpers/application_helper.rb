module ApplicationHelper

  DefaultTitle = "Ruby on Rails Tutorial Sample App"

  def page_title(title="")
     if (title.empty?)
       DefaultTitle
     else
       title + " | " + page_title
     end
  end

end
