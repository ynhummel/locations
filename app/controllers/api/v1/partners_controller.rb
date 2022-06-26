class Api::V1::PartnersController < Api::V1::ApiController
  def index
    render json: "The partners API is up and running!", status: 200
  end

  def search
    render json: { longitude: params[:long], latitude: params[:lat]}, status: 200
  end

  def show
    partner = Partner.find(params[:id])
    render json: partner, status: 200
  end

  def create
      partner = Partner.create!(trading_name: data_params[:tradingName],
                                owner_name: data_params[:ownerName], 
                                document: data_params[:document], 
                                coverage_area: data_params[:coverageArea], 
                                address: data_params[:address])
                                
      render json: partner, status: 201
  end

  private

  def data_params
    data = params.permit(:tradingName, :ownerName, :document)
    coverage_json = params[:coverageArea] && params[:coverageArea].permit!
    address_json = params[:address] && params[:address].permit!

    data.merge(coverageArea: coverage_json, address: address_json)
  end
end
