class OnboardSerializer
  include JSONAPI::Serializer
  attributes :starting_pain_score, :enjoyment_of_life, :activity_interference, :hopes_to_achieve, :anxious, :unable_to_stop_worrying, :little_interest_or_pleasure, :depressed, :type_of_pain, :pain_injections, :spine_surgery
end