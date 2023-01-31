# External DNS
## Example
``` hcl
module external_dns {
  source       = "github.com/provectus/sak-external-dns"
  cluster_name = module.eks.cluster_id
  argocd       = module.argocd.state
  hostedzones  = ["your.hosted.zones"]     # Provide your hosted zones (description in Input section)
}
```
## Requirements

```
terraform >= 1.1
 ```

## Providers

| Name | Version |
|------|---------|
| aws | >= 3.0 |
| helm | >= 1.0 |
| kubernetes | >= 1.11 |
| local | >=2.1.0 |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:-----:|
| argocd | A set of values for enabling deployment through ArgoCD | `map(string)` | `{}` | no |
| aws\_private | Set true or false to use private or public infrastructure | `bool` | `false` | no |
| cluster\_name | The name of the cluster the charts will be deployed to | `string` | n/a | yes |
| conf | A set of parameters to pass to Nginx Ingress Controller chart | `map` | `{}` | no |
| domains | A list of domains to use | `list` | `[]` | no |
| mainzoneid | An ID of the root Route53 zone for creating sub-domains | `string` | `""` | no |
| hostedzones | A list of Route53 hosted zones domains to create, need to provide a list of FQDN strings | `string` | `[]` | yes |
| module\_depends\_on | A list of explicit dependencies for the module | `list` | `[]` | no |
| namespace | A name of the existing namespace | `string` | `"kube-system"` | no |
| namespace\_name | A name of namespace for creating | `string` | `"external-dns"` | no |
| tags | A tags for attaching to new created AWS resources | `map(string)` | `{}` | no |
| vpc\_id | An ID of the VPC for the private Route53 zone | `string` | `""` | no |

## Outputs

| Name | Description |
|------|-------------|
| zone\_id | An ID of the created Route53 zone |
