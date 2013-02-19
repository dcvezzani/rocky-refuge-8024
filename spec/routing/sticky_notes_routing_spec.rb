require "spec_helper"

describe StickyNotesController do
  describe "routing" do

    it "routes to #index" do
      get("/sticky_notes").should route_to("sticky_notes#index")
    end

    it "routes to #new" do
      get("/sticky_notes/new").should route_to("sticky_notes#new")
    end

    it "routes to #show" do
      get("/sticky_notes/1").should route_to("sticky_notes#show", :id => "1")
    end

    it "routes to #edit" do
      get("/sticky_notes/1/edit").should route_to("sticky_notes#edit", :id => "1")
    end

    it "routes to #create" do
      post("/sticky_notes").should route_to("sticky_notes#create")
    end

    it "routes to #update" do
      put("/sticky_notes/1").should route_to("sticky_notes#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/sticky_notes/1").should route_to("sticky_notes#destroy", :id => "1")
    end

  end
end
