require 'rails_helper'

describe Station do
  describe 'creation' do
    it "can be created from api results" do
      raw_data = {
            "access_days_time": "24 hours daily",
            "date_last_confirmed": "2017-08-30",
            "fuel_type_code": "ELEC",
            "id": 66897,
            "groups_with_access_code": "Public",
            "station_name": "UDR",
            "station_phone": "888-758-4389",
            "updated_at": "2017-08-30T08:41:41Z",
            "geocode_status": "GPS",
            "latitude": 39.7300224,
            "longitude": -104.9883424,
            "city": "Denver",
            "intersection_directions": "816 ACOMA 1; For residents only - 5th Floor",
            "state": "CO",
            "street_address": "800 Acoma St",
            "zip": "80204",
            "ev_connector_types": [
                "J1772"
            ],
            "ev_level2_evse_num": 2,
            "ev_network": "ChargePoint Network",
            "ev_network_web": "http://www.chargepoint.com/",
            "ev_network_ids": {
                "posts": [
                    "1:118249"
                ]
            },
            "distance": 0.31422
        }

        result = Station.new(raw_data)

        expect(result.name).to eq('UDR')
        expect(result.address).to eq('800 Acoma St')
        expect(result.fuel_types).to eq('ELEC')
        expect(result.distance).to eq(0.31422)
        expect(result.access_times).to eq('24 hours daily')
    end
  end
end
