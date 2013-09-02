require 'spec_helper'

describe RegionsController do

  context 'GET index' do
    it 'should show all regions' do
      get :index
      response.should be_success
      assigns(:regions).should eq(Region.all.sort)
    end
  end

  context 'GET schedule' do
    it 'should load info for all regions' do
      get :schedule
      response.should be_success
      assigns(:regions).should be_present
    end
  end

  context 'GET show' do
    it 'should find the route by name' do
      get :show, name: 'haiku'
      response.should be_success
      assigns(:region).should be_instance_of(Haiku)
    end

    it 'should redirect to root path when region not found' do
      get :show, name: 'haikus'
      response.should be_redirect
      assigns(:region).should be_blank
    end
  end
end