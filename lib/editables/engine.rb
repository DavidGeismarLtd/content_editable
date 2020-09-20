module Editables
  class Engine < Rails::Engine
    isolate_namespace Editables
    config.before_initialize do
      ActiveSupport.on_load(:action_view) do
         include ApplicationHelper
      end
    end
    config.after_initialize do
      Dir.glob(Rails.root + "app/overrides/**/*_override*.rb").each do |c|
        require_dependency(c)
      end
    end
  end
end
