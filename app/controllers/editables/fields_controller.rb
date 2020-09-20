require_dependency "editables/application_controller"

module Editables
  class FieldsController < ApplicationController
     protect_from_forgery unless: -> { request.format.json? }, only: [:update]
    def update
      puts("in engine's controller")
      respond_to do |format|
        @field = Editables::Field.find(params[:id])
        if @field.update(editable_fields_params)
          # this should be changed
          if @field.image?
            puts("in fields.image")
            format.js
          else
            format.json { render json: {}, status: 200 }
          end
        end
      end
    end

    private

    def editable_fields_params
      params.require(:field).permit(:value, :image)
    end
  end
end
