require "test_helper"

class PartnerTest < ActiveSupport::TestCase
  
  test "Partners should have a trading Name" do
    partner = Partner.new(owner_name: "Zé da Silva", 
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

    assert_not partner.save                      
  end
  
  test "Partners should have a Owner Name" do
    partner = Partner.new(trading_name: "Adega da Cerveja - Pinheiros",
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

    assert_not partner.save                      
  end
  
  test "Partners should have a Coverage Area" do
    partner = Partner.new(trading_name: "Adega da Cerveja - Pinheiros",
                          owner_name: "Zé da Silva",
                          address: { 
                            "type": "Point",
                            "coordinates": [-46.57421, -21.785741]
                          })

    assert_not partner.save                      
  end
  
  test "Partners should have a Address" do
    partner = Partner.new(trading_name: "Adega da Cerveja - Pinheiros",
                          owner_name: "Zé da Silva", 
                          coverage_area: { 
                            "type": "MultiPolygon", 
                            "coordinates": [
                              [[[30, 20], [45, 40], [10, 40], [30, 20]]], 
                              [[[15, 5], [40, 10], [10, 20], [5, 10], [15, 5]]]
                            ]
                          })

    assert_not partner.save                      
  end
  
  test "Partners should have a Document" do
    partner = Partner.new(trading_name: "Adega da Cerveja - Pinheiros",
                          owner_name: "Zé da Silva", 
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

    assert_not partner.save                      
  end

  test "Document should be unique" do
    Partner.create(trading_name: "Adega da Cerveja - Pinheiros",
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
    
    partner = Partner.new(trading_name: "Adega da Cerveja - Pinheiros",
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

    assert_not partner.save                      
  end 
end
