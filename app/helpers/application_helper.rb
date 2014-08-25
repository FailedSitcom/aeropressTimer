module ApplicationHelper
  def title(title)
    content_for(:title) { "#{title} | " }
  end

  def new_recipe_link
    link_to "Add Recipe", new_recipe_path, class: "icon-new right hide-text"
  end
end
