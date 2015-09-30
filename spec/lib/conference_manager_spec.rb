require 'spec_helper'

require_relative '../../lib/parser'
require_relative '../../lib/conference_manager'

describe ConferenceManager, type: :lib do
  describe ".schedule" do
    context 'Input valid' do
      let(:data_valid) { File.read("./spec/data/talk_valid.txt") }
      let(:talks) { Parser.parse_file(data_valid) }
      let(:tracks) { subject.schedule(talks) }

      it "parse success" do
        expect(tracks.size).to eq(2)
        expect(tracks.first.morning_session.size).to eq(3)
        expect(tracks.last.morning_session.size).to eq(2)
        expect(tracks.first.afternoon_session.size).to eq(4)
        expect(tracks.last.afternoon_session.size).to eq(1)
      end
    end
  end
end
