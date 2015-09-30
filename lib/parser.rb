module Parser
  REGEX_WITH_MIN = %r/(\d+)min/
  REGEX_WITHOUT_MIN = %r/lightning$/

  class InvalidInput < StandardError; end

  class << self
    def parse_file(file)
      results = []
      file.each_line do |line|
        results << parse(line)
      end
      results
    rescue NoMethodError
      raise InvalidInput
    end

    private
    def parse(line)
      duration = nil
      str = nil
      match = (line.match REGEX_WITH_MIN) || (line.match REGEX_WITHOUT_MIN)
      if match
        duration = duration_for(match.to_a.last)
      else
        line = nil
      end
      str = remove_newline(line)
      return Talk.new(str, duration)
    rescue NoMethodError
      raise InvalidInput
    end

    def remove_newline(str)
      str.gsub(/\n/, '')
    end

    def duration_for(match)
      return Talk::LIGHTNING_DURATION if match == "lightning"
      match.to_i
    end
  end
end
