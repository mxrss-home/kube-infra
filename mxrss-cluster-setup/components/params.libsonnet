{
  global: {
    // User-defined global parameters; accessible to all component and environments, Ex:
    // replicas: 4,
  },
  components: {
    // Component-level parameters, defined initially from 'ks prototype use ...'
    // Each object below should correspond to a component in the components/ directory
    "certificate-issuer": {
      email: "mike.roth@mxrss.com",
      name: "letsencrypt-staging",
      url: "https://acme-v02.api.letsencrypt.org/directory",
      certificate: {
        name: "mxrss.ddns.net",
        commonName: "mxrss.ddns.net",
        domains: ["mxrss.ddns.net"],
        tlsRefName: "example-com-tls"
      },
    },
    "helm-cert-manager": {
      name: "cert-manager",
      values: {},
      version: "v0.3.2",
    },
  },
}
