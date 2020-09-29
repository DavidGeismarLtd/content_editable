
# Blorgh/lib/concerns/models/article.rb

module Editables::Concerns::Models::Field
  extend ActiveSupport::Concern
  included do
    self.table_name = "editable_fields"

    belongs_to :page, class_name: "Editables::Page", foreign_key: "editable_page_id"
    validates :label, :kind, presence: true
    validates :label, uniqueness: { scope: :editable_page_id }
  end
end
