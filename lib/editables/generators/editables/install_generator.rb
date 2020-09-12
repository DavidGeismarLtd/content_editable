require 'rails/generators'
module Editables
  class InstallGenerator <  Rails::Generators::Base
    source_root File.expand_path('templates', __dir__)
    include Rails::Generators::Migration
    desc "This generator creates all necessary config models and routes"

    def create_page_and_editable_fields_migration
      migration_template "migration.rb", "db/migrate/create_pages_and_fields.rb"
    end

    def create_config_file
      config_dir_path = "config/editable"
      Dir.mkdir(config_dir_path) unless File.exist?(config_dir_path)
      template "config.yml", "#{config_dir_path}/config.yml"
    end

    def create_model_files
      model_dir_path = "app/models/editables"
      Dir.mkdir(model_dir_path) unless File.exist?(model_dir_path)
      template "field.rb", "#{model_dir_path}/field.rb"
      template "page.rb", "#{model_dir_path}/page.rb"
    end

    def add_editable_routes
     editable_route  = "namespace :editables do\n\tresources :fields, only: [:update]\nend\n"
     route editable_route
    end

    def rails5_and_up?
      Rails::VERSION::MAJOR >= 5
    end

    def migration_version
      if rails5_and_up?
        "[#{Rails::VERSION::MAJOR}.#{Rails::VERSION::MINOR}]"
      end
    end
    private

    def self.next_migration_number(dirname)
      next_migration_number = current_migration_number(dirname) + 1
      ActiveRecord::Migration.next_migration_number(next_migration_number)
    end
  end
end
