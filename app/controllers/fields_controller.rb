module Editables
  class FieldsController < ApplicationController
     protect_from_forgery unless: -> { request.format.json? }, only: [:update]
    def update
      respond_to do |format|
        @field = Editables::Field.find(params[:id])
        if @field.update(editable_fields_params)
          if @field.image?
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
