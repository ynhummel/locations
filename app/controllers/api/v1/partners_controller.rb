class Api::V1::PartnersController < ApplicationController
  def index
    render json: "The partners API is up and running!", status: 200
  end

  def create
    begin
      partner = Partner.create!(trading_name: data_params[:tradingName],
                                owner_name: data_params[:ownerName], 
                                document: data_params[:document], 
                                coverage_area: data_params[:coverageArea], 
                                address: data_params[:address])
                                
      render json: partner, status: 201
    rescue Exception => e
      render json: e.message, status: 422
    end
  end

  private

  def data_params
    data = params.permit(:tradingName, :ownerName, :document)
    coverage_json = params[:coverageArea].permit!
    address_json = params[:address].permit!

    data.merge(coverageArea: coverage_json, address: address_json)
  end
end
