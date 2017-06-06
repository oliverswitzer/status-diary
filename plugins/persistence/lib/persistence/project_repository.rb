require 'securerandom'

module Persistence
  class ProjectRepository
    def find_by(name:)
      ProjectRecord.find_by(name: name)
    end

    def save(project)
      require 'securerandom'

      project_record = ProjectRecord.new(
        id: SecureRandom.uuid,
        name: project.name,
        summary: project.summary,
        next_milestone: project.next_milestone
      )

      project_record.save!

      project.id = project_record.id
    end
  end
end
