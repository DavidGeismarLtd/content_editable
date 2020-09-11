module Editables
  module EditableHelper
    def editable_text_class
      'editable editable-text' if current_admin
    end

    def editable_image_class
      'editable-image' if current_admin
    end

    def url_for_image(field, image_method = :image)
      return url_for(field.send(image_method)) if field.send(image_method).attached?
      "https://res.cloudinary.com/dockcyr0z/image/upload/v1598369435/vb13pcfoit64mylb2zzob0pzbt1n.jpg"
    end

    def cloudinary_path(field, image_method = :image)
      return cl_image_path(field.send(image_method).key) if field.send(image_method).attached?
      "https://res.cloudinary.com/dockcyr0z/image/upload/v1598369435/vb13pcfoit64mylb2zzob0pzbt1n.jpg"
    end

    def data_editables(data_editable, editable_kind = :text)
      "data-editablemodel=#{data_editable.model} data-editableroute=#{data_editable.route} data-editableparam=#{data_editable.param} data-editablekind=#{editable_kind}" if current_admin
    end
  end
end
