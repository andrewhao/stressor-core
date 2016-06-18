# A GeoJSON based serialization of
module Commuting
  class StoplightFeatureCollection
    attr_reader :stoplight_clusters

    def initialize(stoplight_clusters)
      @stoplight_clusters = stoplight_clusters
    end

    def wrap
      RGeo::GeoJSON.encode(entity_factory.feature_collection(stoplight_coordinates))
    end

    private

    def stoplight_coordinates
      stoplight_clusters.map(&:centroid).map do |centroid|
        entity_factory.feature(centroid)
      end
    end

    def entity_factory
      RGeo::GeoJSON::EntityFactory.instance
    end
  end
end
