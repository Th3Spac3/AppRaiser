class WorkController < ApplicationController
  def index
    @themes = Theme.all
    @images_count = Image.all.count
    @select_theme = params[:theme].blank? ? '1' : params[:theme]
    @images = Image.theme_images(@select_theme)
    @selected_image_name = Image.first.name
    @values_quantity = Value.all.count
    session[:selected_theme_id] = @select_theme
    params[:counter] = params[:counter].blank? ? 0 : (params[:counter].to_i + params[:image].to_i) % @images.length
  end

  def profile
    values = Value.get_user_value(current_user.id)
    images = Image.find(values.pluck(:image_id))
    @profile_values = values.pluck(:value)
    @profile_themes = images.pluck(:theme_id)
    @profile_files = images.pluck(:file)
  end

  def choose_theme
    @themes = Theme.all.pluck(:name)
    respond_to :js
  end

  def display_theme
    @image_data = {}

    current_user_id = @current_user.id
    if params[:theme].blank?
      theme = "Select theme"
      theme_id = 1
      values_quantity = Value.all.count.round
      data = {index: 0,
              name: Image.first.name,
              values_quantity: values_quantity,
              file: Image.first.file,
              image_id: Image.first.id,
              current_user_id: current_user_id,
              user_valued: false,
              common_average_value: 0,
              value: 0
      }
    else
      theme = params[:theme]
      theme_id = Theme.find_theme_id(theme)
      data = show_image(theme_id, 0)
    end
    session[:selected_theme_id] = theme_id
    image_data(theme, data)
  end
end
