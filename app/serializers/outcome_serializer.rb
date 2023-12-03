class OutcomeSerializer
  include JSONAPI::Serializer
  attributes :recommendation, :outcome_enjoyment_of_life, :outcome_activity_interference, :outcome_anxious, :outcome_unable_to_stop_worrying, :outcome_little_interest_or_pleasure, :outcome_depressed
end