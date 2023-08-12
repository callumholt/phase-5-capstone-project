require "rails_helper"

RSpec.describe SetsCompletedsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/sets_completeds").to route_to("sets_completeds#index")
    end

    it "routes to #show" do
      expect(get: "/sets_completeds/1").to route_to("sets_completeds#show", id: "1")
    end


    it "routes to #create" do
      expect(post: "/sets_completeds").to route_to("sets_completeds#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/sets_completeds/1").to route_to("sets_completeds#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/sets_completeds/1").to route_to("sets_completeds#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/sets_completeds/1").to route_to("sets_completeds#destroy", id: "1")
    end
  end
end
