class CreateEditablePages < ActiveRecord::Migration[6.0]
  def change
    create_table :editable_pages do |t|
      t.string :name
      t.text :description
      t.string :kind
      t.timestamps
    end
  end
end
