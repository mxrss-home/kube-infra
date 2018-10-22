# encoding: utf-8
# copyright: 2018, The Authors


# you add controls here
control 'kube-test-ingres' do                        # A unique ID for this control
  impact 0.7                                # The criticality, if this control fails.
  title 'Test ingress controller'             # A human-readable title
  desc 'This tests to ensure that the ingress controller is setup correctly on the kube host'
  describe http('https://mxrss.ddns.net', method: 'GET') do                  # The actual test
    its('status') { should eq 200 }
  end
end
