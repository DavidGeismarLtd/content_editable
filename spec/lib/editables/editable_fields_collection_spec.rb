# require 'rails_helper'
RSpec.describe Editables::FieldsCollection do

  def create_categories
    create :category, :dpc
    create :category, :masterclass
    create :category, :university
  end

  def create_editable_fields
    create :field, :with_text, label: 'field_with_text'
    create :field, :with_image, label: 'field_with_image'
  end

  before(:all) do
    create_editable_fields
  end

  let(:categories) {
    [
      double('dpc', class: "Category", id: 1, label: "dpc", description: 'description'),
      double('masterclass', class: "Category", id: 2, label: "masterclass", description: 'description'),
      double('attestation univ', class: "Category", id: 3, label: "attestation universitaire", description: 'description')
    ]
  }

  let(:fields) {
    Editables::FieldsCollection.new({
      description: categories,
      value: Editables::Field.all
    })
  }

  describe ".new" do
    describe 'takes a config of editables and builds a constant time accessible data structure from it' do
      it 'creates top level keys with the name of the classes of the object given underscored' do
        expect(fields.collection.keys).to match_array %w(category editables/field)
      end

      it 'creates second level keys based on the label of the objects given' do
        expect(fields.collection["editables/field"].keys).to match_array %w(field_with_text field_with_image)
        expect(fields.collection["category"].keys).to match_array ['dpc', 'masterclass', 'attestation universitaire']
      end

      it 'creates a DataEditable entry for each instance given' do
        categories.each do |category|
          expect(fields.collection["category"][category.label]).to be_kind_of Editables::DataEditable
        end
        Editables::Field.all.each do |editable|
          expect(fields.collection["editables/field"][editable.label]).to be_kind_of Editables::DataEditable
        end
      end
    end
  end

  describe '[]' do
    it 'it finds the corresponding dataEditable in the collection' do
      target = fields["category"]['dpc']
      expect(target.instance.id).to eq 1
    end

    it 'it fallsback to editable_field default first level key if it doesnt find the key' do
      field_id = Editables::Field.find_by_label('field_with_text').id
      target = fields['field_with_text']
      expect(target.instance.id).to eq field_id
    end

    it 'raises a missing key error if it doesnt find the key' do
      missing_key = 'missing key'
      expect{ fields[missing_key] }.to raise_error(KeyError)
    end

  end
end
