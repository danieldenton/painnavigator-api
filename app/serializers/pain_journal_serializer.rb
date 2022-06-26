class PainJournalSerializer
  include JSONAPI::Serializer
  attributes :id, :created_at, :date_time_value, :intensity, :situation, :feeling, :who_i_was_with, :coping_strategies, :notes, :intensity_after
end