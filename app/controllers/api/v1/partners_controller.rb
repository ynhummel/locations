class Api::V1::PartnersController < ApplicationController
  def index
    render json: "The partners API is up and running!", status: 200
  end

  def create
    begin
      partner = Partner.create!(partner_params)
      render json: partner, status: 201
    rescue Exception => e
      render json: e.message, status: 422
    end
  end

  private

  def partner_params
    request = params.permit(:tradingName, :ownerName, :document, :coverageArea, :address)
  end
end
