module Editables
  class DataEditable
    attr_accessor :route, :model, :param, :value, :instance
    #format :json should be dealt by the frontend api
    def initialize(field, param = :value)
      @route ="/#{field.class.to_s.underscore.pluralize}/#{field.id}"
      @model = field.class.to_s.underscore.split('/').last
      @param = param
      @value = field.send(param)
      @instance = field
    end
  end
end
