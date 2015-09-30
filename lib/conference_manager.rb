require './model/track'

module ConferenceManager
  SESSION_DURATION = [180, 240]

  class << self
    def schedule(talks)
      tracks = []
      until talks.empty?
        track = Track.new
        SESSION_DURATION.each do |duration|
          sum = 0
          talks.each do |talk|
            next if (sum + talk.duration_time) > duration
            add_session(track, talk, duration)
            sum += talk.duration_time
            talks.delete(talk)
          end
        end
        tracks << track
      end
      tracks
    end

    private
    def add_session(track, talk, duration)
      if duration == 180
        track.morning_session << talk
      else
        track.afternoon_session << talk
      end
    end
  end
end
