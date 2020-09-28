require 'rails_helper'
RSpec.describe Editables::DataEditable do

  let(:active_record_object) { double('fake active_record_object', class: "Category", id: 1, description: "ma description") }
  let(:param) { :description }
  let(:data_editable) { Editables::DataEditable.new(active_record_object, param) }

  describe 'route' do
    it 'should return the correct Update route for the given ressource' do
      expect(data_editable.route).to eq "/categories/1"
    end
  end

  describe 'value' do
    it 'should return the correct value based on the field and param provided' do
      expect(data_editable.value).to eq "ma description"
    end
  end
end
