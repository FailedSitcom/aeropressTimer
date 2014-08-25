module ApplicationHelper
  def new_recipe_link
    link_to "Add Recipe", new_recipe_path, class: "icon-new right hide-text"
  end
end
