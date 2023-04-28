# Chef InSpec
# https://www.chef.io/inspec

# Since this is the default test, we want to test as much as possible here and not be redundant in the other tests.

project = input('project')
name = input('name')

control 'compute_firewall' do
  title 'Compute Firewall'

  # Compute Firewall Resource
  # https://www.inspec.io/docs/reference/resources/google_compute_firewall

  describe google_compute_firewall(project: project, name: "#{name}-test-01") do
    it { should exist }
    its('direction') { should eq 'INGRESS' }
    its('log_config.enable') { should eq true }
    its('log_config.metadata') { should eq 'INCLUDE_ALL_METADATA' }
    its('source_ranges') { should eq ['130.211.0.0/22', '35.191.0.0/16'] }
  end

  describe google_compute_firewall(project: project, name: "#{name}-test-02") do
    its('direction') { should eq 'EGRESS' }
    its('log_config.enable') { should eq false }
  end

  describe google_compute_firewall(project: project, name: "#{name}-test-03") do
    its('log_config.enable') { should eq true }
    its('log_config.metadata') { should eq 'EXCLUDE_ALL_METADATA' }
    its('source_ranges') { should eq ['10.0.0.8/32'] }
    it { should allow_port_protocol('5432', 'tcp') }
  end
end

control 'compute_network' do
  title 'Compute Network'

  # Compute Network Resource
  # https://www.inspec.io/docs/reference/resources/google_compute_network

  describe google_compute_network(project: project, name: name) do
    it { should exist }
  end
end

control 'compute_subnet' do
  title 'Compute Subnet'

  # Compute Subnetwork Resource
  # https://docs.chef.io/inspec/resources/google_compute_subnetwork

  describe google_compute_subnetwork(project: project, name: 'default-subnet-us-east1', region: 'us-east1') do
    it { should exist }
    its('log_config.flow_sampling') { should eq 0.5 }
    its('log_config.aggregation_interval') { should cmp 'INTERVAL_5_SEC' }
    its('log_config.metadata') { should include 'INCLUDE_ALL_METADATA' }
    its('private_ip_google_access') { should eq true }
  end

  describe google_compute_subnetwork(project: project, name: 'default-internal-lb-subnet-us-east1',
                                     region: 'us-east1') do
    it { should exist }
    its('purpose') { should cmp 'INTERNAL_HTTPS_LOAD_BALANCER' }
    its('role') { should cmp 'ACTIVE' }
  end
end
