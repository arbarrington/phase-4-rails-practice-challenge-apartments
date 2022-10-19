class ApartmentsController < ApplicationController
    before_action :set_apartment, only: [:show, :update, :destroy]

    def index
        render json: Apartment.all, status: :ok
    end

    def show
        render json: @apartment, status: :ok
    end

    def create
        apartment = Apartment.create!(apartment_params)
        render json: apartment, status: :created
    end

    def update
        @apartment.update!(apartment_params)
        render json: @apartment, status: :accepted
    end

    def destroy
        @apartment.destroy
        head :no_content
    end


    private

    def set_apartment
        @apartment = Apartment.find(params[:id])
    end

    def apartment_params
        params.permit(:number)
    end
end
