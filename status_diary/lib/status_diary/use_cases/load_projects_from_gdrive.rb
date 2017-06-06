require_relative '../entities/project'

class LoadProjectsFromGDrive
  def initialize(project_repo:, project_status_fetcher:)
    @project_repo = project_repo
    @project_status_fetcher = project_status_fetcher
  end

  def perform
    @project_status_fetcher.get_projects.each do |project|
      @project_repo.save(Project.new(
        name: project[:name],
        summary: project[:summary],
        next_milestone: project[:next_milestone]
      ))
    end
  end
end
