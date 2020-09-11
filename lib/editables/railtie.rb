class Editables::Railtie < Rails::Railtie
  config.after_initialize do |app|
    ActionView::Base.send :include, Editables::EditableHelper
  end
end
