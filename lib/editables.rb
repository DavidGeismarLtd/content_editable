module Editables

  autoload :DataEditable, 'editables/data_editable'
  autoload :FieldsCollection, 'editables/fields_collection'
end


require('editables/generators/editables/install_generator')
# require "editables/helper" if defined?(::ActionView::Base)
# require "editables/railtie" if defined?(Rails) && defined?(Rails::Railtie)
require "editables/engine"
