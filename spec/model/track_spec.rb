require 'spec_helper'

require_relative "../../model/track"

describe Track, type: :model do
  let(:track) { Track.new }

  describe "#initialize" do
    it "creates a new Track" do
      expect(track.morning_session).to eq []
      expect(track.afternoon_session).to eq []
    end
  end
end
