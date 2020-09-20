class CreateEditableFields < ActiveRecord::Migration[6.0]
  def change
    create_table :editable_fields do |t|
      t.string :label
      t.string :kind
      t.text :value
      t.references :page, foreign_key: true
      t.timestamps
    end
  end
end
