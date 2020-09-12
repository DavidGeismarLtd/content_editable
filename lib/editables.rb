module Editables

  autoload :DataEditable, 'editables/data_editable'
  autoload :FieldsCollection, 'editables/fields_collection'
end


require('editables/generators/editables/install_generator')
# Prevent require loop if included after Rails is already initialized.
require "editables/helper" if defined?(::ActionView::Base)
require "editables/railtie" if defined?(Rails) && defined?(Rails::Railtie)
require "editables/engine"
