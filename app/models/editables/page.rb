module Editables
  class Page < ApplicationRecord
    self.table_name = "editable_pages"
    has_many :fields, class_name: "::Editables::Field", foreign_key: "editable_page_id"
  end
end
