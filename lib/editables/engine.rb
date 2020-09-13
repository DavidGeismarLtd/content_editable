module Editables
  class Engine < Rails::Engine
   isolate_namespace Editables
    config.to_prepare do
      ApplicationController.helper(EditablesHelper)
      Dir.glob(Rails.root + "app/overrides/**/*_override*.rb").each do |c|
        require_dependency(c)
      end
    end
  end
end
