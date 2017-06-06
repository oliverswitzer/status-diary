require_relative '../lib/status_diary'
require_relative 'support/fake_project_repo'
require 'byebug'

describe LoadProjectsFromGDrive do
  let(:project_repo) { FakeProjectRepo.new }
  let(:project_status_fetcher) { StatusNotesFetcher.new }

  subject do
    LoadProjectsFromGDrive.new(
      project_repo: project_repo,
      project_status_fetcher: project_status_fetcher
    )
  end

  before do
    allow(project_status_fetcher).to receive(:get_projects).and_return([
      { name: 'some project', summary: 'this was a good week', next_milestone: 'eating cake'},
      { name: 'some other project', summary: 'this was a bad week', next_milestone: 'not eating cake' }
    ])
  end

  it 'saves projects' do
    subject.perform

    project = project_repo.find(id: 0)
    expect(project.name).to eq('some project')
    expect(project.summary).to eq('this was a good week')
    expect(project.next_milestone).to eq('eating cake')

    project = project_repo.find(id: 1)
    expect(project.name).to eq('some other project')
    expect(project.summary).to eq('this was a bad week')
    expect(project.next_milestone).to eq('not eating cake')
  end
end


class StatusNotesFetcher

end
