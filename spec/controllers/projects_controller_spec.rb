require 'spec_helper'

describe ProjectsController do
  DatabaseCleaner.clean

  context "#create" do
    before :each do
      project_file.stubs(:original_filename).returns("hand.jpg")
      project_file.stubs(:tempfile).returns("hand.jpg")

      # LATER: Check rspec fixture_file_upload method.
    end

    let :project_file do
      File.open(File.join(Rails.root, 'spec', 'support', 'assets', 'hand.jpg'))
    end

    it "should create a worker" do
      expect {
        post :create, { source_work_file: project_file, project: FactoryGirl.attributes_for(:project) }
      }.to change(ProjectFilesWorker.jobs, :size).by(1)
    end
  end
end
