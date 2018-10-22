local env = std.extVar("__ksonnet/environments");
local params = std.extVar("__ksonnet/params").components["helm-cert-manager"];

std.prune(std.native("renderHelmChart")(
   // registry name
   "helm-stable",
   // chart name
   "cert-manager",
   // chart version
   params.version,
   // chart values overrides
   params.values,
   // component name
   params.name,
 ))
