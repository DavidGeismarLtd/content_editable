class CreatePagesAndFields< ActiveRecord::Migration<%= migration_version %>
  def change
    create_table :editable_pages do |t|
      t.string :name
      t.text :description
      t.string :kind
      t.timestamps
    end
    create_table :editable_fields do |t|
      t.string :label
      t.string :kind
      t.text :value
      t.references :page, foreign_key: true
      t.timestamps
    end
  end
end
