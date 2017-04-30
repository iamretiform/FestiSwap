class SearchesEvents
  attr_reader :query, :result

  def initialize(query:, base: Event.all)
    @query  = query
    @result = base
  end

  def call
    @result = result.near(query) if query
    @result
  end
end
