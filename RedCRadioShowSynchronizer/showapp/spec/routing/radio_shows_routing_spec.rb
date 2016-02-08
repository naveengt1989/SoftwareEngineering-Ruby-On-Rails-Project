require "rails_helper"

RSpec.describe RadioShowsController, :type => :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/radio_shows").to route_to("radio_shows#index")
    end

    it "routes to #new" do
      expect(:get => "/radio_shows/new").to route_to("radio_shows#new")
    end

    it "routes to #show" do
      expect(:get => "/radio_shows/1").to route_to("radio_shows#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/radio_shows/1/edit").to route_to("radio_shows#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/radio_shows").to route_to("radio_shows#create")
    end

    it "routes to #update" do
      expect(:put => "/radio_shows/1").to route_to("radio_shows#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/radio_shows/1").to route_to("radio_shows#destroy", :id => "1")
    end

  end
end
