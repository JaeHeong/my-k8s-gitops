# My K8s GitOps

Kubernetes GitOps 모노레포

## 구조

```
my-k8s-gitops/
├── apps/              # 내 앱 Helm Charts
├── infra/             # 공식 Chart values (prometheus, grafana 등)
├── argocd-apps/       # ArgoCD Application manifests
│   ├── apps/          # 앱용 Application
│   ├── infra/         # 인프라용 Application
│   └── projects/      # AppProject 정의
└── sealed-secrets/    # 암호화된 Secret
```

## 사용법

### 1. ArgoCD 설치
```bash
helm repo add argo https://argoproj.github.io/argo-helm
helm install argocd argo/argo-cd -n argocd --create-namespace -f infra/argocd/values.yaml
```

### 2. Root App 배포
```bash
kubectl apply -f argocd-apps/root-app.yaml
```

### 3. Sealed Secrets 사용
```bash
# Secret 암호화
kubectl create secret generic my-secret \
  --from-literal=key=value \
  --dry-run=client -o yaml | \
  kubeseal --format yaml > sealed-secrets/my-secret.yaml
```
