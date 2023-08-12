require "rails_helper"

RSpec.describe SetsPrescribedsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/sets_prescribeds").to route_to("sets_prescribeds#index")
    end

    it "routes to #show" do
      expect(get: "/sets_prescribeds/1").to route_to("sets_prescribeds#show", id: "1")
    end


    it "routes to #create" do
      expect(post: "/sets_prescribeds").to route_to("sets_prescribeds#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/sets_prescribeds/1").to route_to("sets_prescribeds#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/sets_prescribeds/1").to route_to("sets_prescribeds#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/sets_prescribeds/1").to route_to("sets_prescribeds#destroy", id: "1")
    end
  end
end
