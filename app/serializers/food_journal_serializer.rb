class FoodJournalSerializer
  include JSONAPI::Serializer
  attributes :id, :date_time_value, :breakfast, :lunch, :dinner, :snacks, :created
end