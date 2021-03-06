require 'spec_helper'

describe SearchController do

  context 'GET index' do
    it 'should render index view in map_hybrid layout' do
      get :index
      response.should be_success
      response.should have_rendered('layouts/map_hybrid', 'search/index')
    end

    it 'should find routes' do
      get :index, origin: 'liholiho_kanaloa_ave', destination: 'queen_kaahumanu', search_time: '7:00 AM'
      response.should be_success
      assigns(:courses).length.should == 2
    end

    it 'should not find routes when origin == destination' do
      get :index, origin: 'queen_kaahumanu', destination: 'queen_kaahumanu'
      response.should be_success
      assigns(:courses).should be_empty
    end

    it 'should respond with a partial when requested via AJAX' do
      xhr :get, :index, origin: 'liholiho_kanaloa_ave', destination: 'queen_kaahumanu', search_time: '7:00 AM'
      response.should be_success
      response.should have_rendered(partial: 'search/_direct_routes')
      assigns(:courses).length.should == 2
    end
  end
end