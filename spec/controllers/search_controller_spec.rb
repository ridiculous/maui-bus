require 'spec_helper'

describe SearchController do

  context 'GET index' do
    it 'should render index page' do
      get :index
      response.should be_success
      response.should have_rendered('layouts/map_hybrid', 'search/index')
    end

    it 'should find routes' do
      get :index, origin: 'liholiho_kanaloa_ave', destination: 'queen_kaahumanu', search_time: '7:00 AM'
      response.should be_success
      assigns(:trip).should be_present
      assigns(:trip).should have(2).courses
    end

    it 'should not find routes when origin == destination' do
      get :index, origin: 'queen_kaahumanu', destination: 'queen_kaahumanu'
      response.should be_success
      assigns(:trip).should be_present
      assigns(:trip).should have(0).courses
      assigns(:trip).should be_has_same_points
    end

    it 'should render partial when request.xhr?' do
      xhr :get, :index, origin: 'liholiho_kanaloa_ave', destination: 'queen_kaahumanu', search_time: '7:00 AM'
      response.should be_success
      response.should have_rendered(partial: 'search/_direct_routes')
      assigns(:trip).should be_present
      assigns(:trip).should have(2).courses
    end
  end
end