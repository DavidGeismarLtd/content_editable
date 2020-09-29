module Editables
  class Field < ApplicationRecord
    include Editables::Concerns::Models::Field
  end
end
