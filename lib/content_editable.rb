module ContentEditable

  # Prevent require loop if included after Rails is already initialized.
  require "cloudinary/helper" if defined?(::ActionView::Base)
  require "cloudinary/cloudinary_controller" if defined?(::ActionController::Base)
  require "cloudinary/railtie" if defined?(Rails) && defined?(Rails::Railtie)
  require "cloudinary/engine" if defined?(Rails) && defined?(Rails::Engine)
end
