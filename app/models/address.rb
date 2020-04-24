class Address < ApplicationRecord
    # include Geocoder::Model::Mongoid
    # include Geocoder::Model::MongoMapper
    geocoded_by :address
    belongs_to :entity, polymorphic: true
end
