module Editables
  autoload :DataEditable, 'editables/data_editable'
  autoload :FieldsCollection, 'editables/fields_collection'
end
# Prevent require loop if included after Rails is already initialized.
require "editables/helper" if defined?(::ActionView::Base)
require "editables/fields_controller" if defined?(::ActionController::Base)
require "editables/railtie" if defined?(Rails) && defined?(Rails::Railtie)
# require "editables/engine" if defined?(Rails) && defined?(Rails::Engine)
