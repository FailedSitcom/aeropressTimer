module ApplicationHelper
  def title(title)
    content_for(:title) { "#{title} | " }
    content_tag(:h2, title, class: "page-title truncate", title: title)
  end

  def new_recipe_link
    link_to "Add Recipe", new_recipe_path, class: "icon-new right hide-text"
  end
end
