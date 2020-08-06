module ApplicationHelper
    def link_to_image(image_path)
    link_to(image_tag(image_path, :border => "0"))
  end
end
