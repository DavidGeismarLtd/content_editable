namespace :editables do
  desc 'Create editable objects from config file'
  task create_from_config: :environment do
    editable_config_path = Rails.root.join('config', 'editable', 'config.yml')
    editables = YAML::load(File.open(editable_config_path.to_s))

    editables["pages"].each do |page_name, page_config|
      page = Editables::Page.create(
        name: page_name,
        description: page_config["description"],
        kind: page_config["kind"]
      )
      page_config["fields"].each do |field_name, field_config|
        Editables::Field.create({
          label: field_name,
          kind: field_config['kind'],
          value: field_config['value'],
          editable_page_id: page.id,
        })
      end
    end
  end
end
