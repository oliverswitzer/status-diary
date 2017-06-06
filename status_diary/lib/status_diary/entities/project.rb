class Project
  attr_reader :name, :summary, :next_milestone
  attr_accessor :id

  def initialize(name:nil, summary:nil, next_milestone:nil)
    @name = name
    @summary = summary
    @next_milestone = next_milestone
  end
end
