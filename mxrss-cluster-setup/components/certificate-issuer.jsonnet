local env = std.extVar("__ksonnet/environments");
local params = std.extVar("__ksonnet/params").components["certificate-issuer"];
[
{
  apiVersion: "certmanager.k8s.io/v1alpha1",
  kind: "Issuer",
  metadata: {
    name: params.name,
  },
  spec: {
    acme: {
      server: params.url,
      email: params.email,
      privateKeySecretRef: {
        name: params.name,
      },
      http01: {}
    }
  }
},
{
  apiVersion: "certmanager.k8s.io/v1alpha1",
  kind: "Certificate",
  metadata: {
    name: params.certificate.name
  },
  spec: {
    secretName: params.certificate.tlsRefName,
    issuerRef: {
      name: "letsencrypt-staging"
    },
    commonName: params.certificate.commonName,
    dnsNames: params.certificate.domains,
    acme: {
      config: [
        {
          http01: {
            ingressClass: "nginx"
          },
          domains: params.certificate.domains,
        }
      ]
    }
  }
}
]
