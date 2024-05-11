class ApiController < ApplicationController
  include WorkImage

  def next_image
    current_index = params[:index].to_i
    theme_id = params[:theme_id].to_i
    length = params[:length].to_i

    new_image_index = next_index(current_index, length)
    next_image_data = show_image(theme_id, new_image_index)

    respond_to do |format|
      if new_image_index.blank?
        format.html{render nothing: true, status: :unprocessable_entity}
        format.json {}
      else
        format.html{render display_theme_path, status: :ok}
        format.json {render json:
                              {new_image_index: next_image_data[:index],
                               name: next_image_data[:name],
                               file: next_image_data[:file],
                               image_id: next_image_data[:image_id],
                               user_valued: next_image_data[:user_valued],
                               common_average_value: next_image_data[:common_average_value],
                               value: next_image_data[:value],
                               status: :ok,
                               notice: 'Success'}
        }
      end
    end
  end
  def next_index(index, length)
    new_index = index
    index<length-1?new_index+=1:new_index=0
    new_index
  end
  def previous_index(index, length)
    new_index = index
    index>0?new_index-=1:new_index=length-1
    new_index
  end
end
