# Chef InSpec
# https://www.chef.io/inspec

project = input('project')

control 'compute_project_info' do
  title 'Compute Project Info'

  describe google_compute_project_info(project: project) do
    its('xpn_project_status') { should eq 'HOST' }
  end
end
