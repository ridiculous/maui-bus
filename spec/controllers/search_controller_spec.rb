require 'spec_helper'

describe SearchController do

  context 'GET index' do
    it 'should render index page' do
      get :index
      response.should be_success
      response.should have_rendered('layouts/map', 'search/index')
    end
  end
end