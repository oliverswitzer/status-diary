
class FakeProjectRepo
  def initialize
    @projects = []
  end

  def find_by(name:)
    @projects.find { |project| project.name == name }
  end

  def save(project)
    require 'securerandom'

    project.id = SecureRandom.uuid
    @projects << project
  end
end
