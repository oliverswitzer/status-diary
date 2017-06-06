require_relative '../entities/project'

def project_repo_contract(repo_klass)
  describe 'whiteboard repo' do
    let(:first_project) do
      Project.new(
        name: 'foo project',
        summary: 'this was a good week',
        next_milestone: 'eating cake'
      )
    end

    let(:second_project) do
      Project.new(
        name: 'bar project',
        summary: 'this was a bad week',
        next_milestone: 'not eating cake'
      )
    end

    let(:repo) { repo_klass.new }

    before do
      repo.save(first_project)
      repo.save(second_project)
    end

    describe 'findBy' do
      it 'finds by name' do
        saved_first_project = repo.find_by(name: 'foo project')
        expect(saved_first_project.summary).to eq('this was a good week')
        expect(saved_first_project.next_milestone).to eq('eating cake')

        saved_second_project = repo.find_by(name: 'bar project')
        expect(saved_second_project.summary).to eq('this was a bad week')
        expect(saved_second_project.next_milestone).to eq('not eating cake')
      end
    end

    describe 'save' do
      it 'creates unique IDs for whiteboards when saved' do
        expect(first_project.id).to be
        expect(second_project.id).to be
        expect(first_project.id).not_to eq(second_project.id)
      end
    end
  end
end
