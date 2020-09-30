module Editables
  class Field < ApplicationRecord
    include Editables::Concerns::Field
  end
end
