require 'spec_helper'

describe SearchController do

  context 'GET index' do
    it 'should render index page' do
      get :index
      response.should be_success
      response.should have_rendered('layouts/map_hybrid', 'search/index')
      assigns(:trip).should be_present
      assigns(:trips).should be_present
    end
  end
end