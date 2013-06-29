require 'spec_helper'

describe BusRoutesController do

  context 'GET show_map' do

    it 'should find the route and load its map' do
      haiku = Haiku.new
      get :show_map, region_name: haiku.class.to_s, name: haiku.islander.class_name
      response.should be_success
      response.should have_rendered('bus_routes/show_map')
      assigns(:region).should be_a(Haiku)
      assigns(:bus).should be_a(Haiku::Islander)
    end
  end
end