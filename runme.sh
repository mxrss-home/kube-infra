KS_NAMESPACE=ks-infra-kube
kubectl create namespace $KS_NAMESPACE

CURRENT_CONTEXT=$(kubectl config current-context)
CURRENT_CLUSTER=$(kubectl config get-contexts $CURRENT_CONTEXT | tail -1 | awk '{print $3}')
CURRENT_USER=$(kubectl config get-contexts $CURRENT_CONTEXT | tail -1 | awk '{print $4}')

kubectl config set-context $KS_NAMESPACE \
  --namespace $KS_NAMESPACE \
  --cluster $CURRENT_CLUSTER \
  --user $CURRENT_USER