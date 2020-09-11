module Editables
  class FieldsCollection
    attr_reader :collection
    def initialize(editables_config)
      @collection = to_hash(editables_config)
    end

    def [](key)
      begin
        collection.fetch(key)
      rescue
        collection.fetch("editables/field").fetch(key)
      end
    end

    private

    def to_hash(editables_config)
      hash = {}
      editables_config.each do |param, editables|
        hash[editables&.first&.class&.to_s&.underscore] ||= {}
        editables.each do |editable|
          hash[editable.class.to_s.underscore][editable.label] = ::Editables::DataEditable.new(editable, param)
        end
      end
      return hash
    end
  end
end
