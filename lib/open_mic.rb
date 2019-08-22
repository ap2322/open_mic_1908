class OpenMic
  def initialize(event)
    @location = event[:location]
    @date = event[:date]
    @performers = []
    # @event = {
    #   location: event[:location],
    #   date: event[:date],
    #   performers: [],
    # }
  end

  def location
    @event[:location]
  end

  def date
    @event[:date]
  end

  def performers
    @event[:performers]
  end

  def welcome(user)
    @event[:performers] << user
  end

  def repeated_jokes?
    jokes_told = @event[:performers].map do |performer|
      performer.jokes
    end

    # if length of an array of joke ids == array of unique joke ids, then no repeats
    # if length of an array of joke ids != array of uniq joke ids, then yes repeats
    joke_ids = jokes_told.flatten.map do |joke|
      joke.id
    end

    if joke_ids.length == joke_ids.uniq.length
      return false
    else
      return true
    end
  end

end
