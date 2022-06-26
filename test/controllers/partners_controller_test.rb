require "test_helper"

class Api::V1::PartnersControllerTest < ActionDispatch::IntegrationTest
 
  test "GET id endpoint" do
    partner = Partner.create!(trading_name: "Adega da Cerveja - Pinheiros",
                          owner_name: "Zé da Silva", 
                          document:"1432132123891/0001", 
                          coverage_area: { 
                            "type": "MultiPolygon", 
                            "coordinates": [
                              [[[30, 20], [45, 40], [10, 40], [30, 20]]], 
                              [[[15, 5], [40, 10], [10, 20], [5, 10], [15, 5]]]
                            ]
                          }, 
                          address: { 
                            "type": "Point",
                            "coordinates": [-46.57421, -21.785741]
                          })
    get api_v1_partner_url(partner.id)
    assert_response :ok
  end

  test "GET id endpoint, id doesn't exists" do
    get api_v1_partner_url(9999999)
    assert_response :not_found
  end
 
  test "POST partner endpoint" do
    post "/api/v1/partners",
      params: {
        "id": 1, 
        "tradingName": "Adega da Cerveja - Pinheiros",
        "ownerName": "Zé da Silva",
        "document": "1432132123891/0001",
        "coverageArea": { 
          "type": "MultiPolygon", 
          "coordinates": [
            [[[30, 20], [45, 40], [10, 40], [30, 20]]], 
            [[[15, 5], [40, 10], [10, 20], [5, 10], [15, 5]]]
          ]
        },
        "address": { 
          "type": "Point",
          "coordinates": [-46.57421, -21.785741]
        }
      } 
    assert_response :created
  end
 
  test "POST partner endpoint, without required fields" do
    post "/api/v1/partners",
      params: {
        "id": 1, 
        "tradingName": "Adega da Cerveja - Pinheiros",
        "document": "1432132123891/0001",
        "address": { 
          "type": "Point",
          "coordinates": [-46.57421, -21.785741]
        }
      } 
    assert_response :unprocessable_entity
  end
end
