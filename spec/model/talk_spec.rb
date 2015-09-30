require "spec_helper"

require_relative "../../model/talk"

describe Talk do
  let(:talk) { Talk.new("Talk 30min", 30) }

  describe "#initialize" do
    it "creates a new Talk" do
      expect(talk.title).to eq "Talk 30min"
      expect(talk.duration_time).to eq 30
    end
  end

  describe "#to_print" do
    it "prints a Talk" do
      expect(talk.to_print).to eq "Talk 30min"
    end
  end
end
