class MoodJournalSerializer
  include JSONAPI::Serializer
  attributes :id, :date_time_value, :intensity, :situation, :feeling, :who_i_was_with, :primary_thought, :cognitive_distortions, :created
end