require 'spec_helper'

require_relative '../../lib/parser'

describe Parser, type: :lib do

  describe ".parse_file" do
    context 'Input invalid' do
      it "raises InvalidInput" do
        expect { subject.parse_file(nil) }.to raise_error(Parser::InvalidInput)
      end
    end

    context 'Input valid' do
      let(:data_valid) { File.read("./spec/data/talk_valid.txt") }
      let(:data_invalid) { File.read("./spec/data/talk_invalid.txt") }
      let(:parsed_file) { subject.parse_file(data_valid) }

      it "parse success" do
        expect(parsed_file.size).to eq(10)
        expect(parsed_file.first).to be_a(Talk)
        expect(parsed_file.first.title).to eq("Writing Fast Tests Against Enterprise Rails 60min")
        expect(parsed_file.first.duration_time).to eq(60)
      end

      it "raises InvalidInput" do
        expect { subject.parse_file(data_invalid) }.to raise_error(Parser::InvalidInput)
      end
    end
  end
end
