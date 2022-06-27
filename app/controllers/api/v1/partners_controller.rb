require 'rgeo'
require 'rgeo/geo_json'

class Api::V1::PartnersController < Api::V1::ApiController
  def index
    render json: "The partners API is up and running!", status: 200
  end

  def search
    nearest_partner = search_nearest(params[:long], params[:lat])
    raise ActiveRecord::RecordNotFound.new if nearest_partner.nil?
    render json: nearest_partner, status: 200
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

  def search_nearest(long, lat)
    factory = RGeo::Geographic.simple_mercator_factory()
    my_location = factory.point(params[:long], params[:lat])

    min_dist = Float::INFINITY
    nearest_partner = nil

    partners = Partner.pluck(:id, :address, :coverage_area)
    partners.each do |point|
      multi_polygon = RGeo::GeoJSON.decode(point[2])
      next unless multi_polygon.contains?(my_location)
      geom = RGeo::GeoJSON.decode(point[1])
      dist = geom.distance(my_location)
      if dist < min_dist
        min_dist = dist
        min_dist_id = point[0]
      end
      nearest_partner = Partner.find(min_dist_id)
    end
    nearest_partner
  end
end
