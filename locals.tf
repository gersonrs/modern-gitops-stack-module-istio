locals {
  helm_values = [{
    istiod = {
      profile = "ambient"
      meshConfig = {
        accessLogFile = "/dev/stdout"
        defaultConfig = {
          discoveryAddress = "istiod.istio-system.svc:15012"
          proxyMetadata    = {}
          tracing          = {}
        }
        enablePrometheusMerge = true
        rootNamespace         = var.namespace
        tcpKeepalive = {
          interval = "5s"
          probes   = 3
          time     = "10s"
        }
        trustDomain = "cluster.local"
        extensionProviders = [{
          envoyExtAuthzHttp = {
            headersToDownstreamOnDeny = [
              "content-type",
              "set-cookie"
            ]
            headersToUpstreamOnAllow = [
              "authorization",
              "path",
              "x-auth-request-email",
              "x-auth-request-groups",
              "x-auth-request-user"
            ]
            includeRequestHeadersInCheck = [
              "authorization",
              "cookie"
            ]
            service = "oauth2-proxy.oauth2-proxy.svc.cluster.local"
            port    = 80
          }
          name = "oauth2-proxy"
        }]
      }
    }
    cni = {
      profile = "ambient"
    }
    gateway = {
      service = {
        type = "ClusterIP"
      }
    }
    kiali-operator = {
      cr = {
        create = true
        namespace : var.namespace
        annotations : {}
        spec = {
          auth = {
            strategy = "anonymous"
          }
          deployment = {
            cluster_wide_access = true
            # discovery_selectors = {
            #   default = [
            #     {
            #       matchLabels = {
            #         "kubernetes.io/metadata.name" = "default"
            #       }
            #     },
            #     {
            #       matchLabels = {
            #         region = "east"
            #       },
            #       matchExpressions = [
            #         {
            #           key      = "app"
            #           operator = "In"
            #           values   = ["ticketing"]
            #         },
            #         {
            #           key      = "color"
            #           operator = "In"
            #           values   = ["blue"]
            #         }
            #       ]
            #     }
            #   ]
            # }
            view_only_mode = false
          }
          server = {
            web_root = "/kiali"
          }
          external_services = {
            prometheus = {
              url = "http://kube-prometheus-stack-prometheus.kube-prometheus-stack.svc.cluster.local:9090/"
            }
            grafana = {
              enabled      = true
              internal_url = "http://kube-prometheus-stack-grafana.kube-prometheus-stack.svc.cluster.local:80/"
              external_url = "https://grafana.apps.kind.172-19-0-101.nip.io/"
              dashboards = [
                {
                  name = "Istio Service Dashboard"
                  variables = {
                    namespace = var.namespace
                    service   = "var-service"
                  }
                },
                {
                  name = "Istio Workload Dashboard"
                  variables = {
                    namespace = var.namespace
                    workload  = "var-workload"
                  }
                },
                {
                  name = "Istio Mesh Dashboard"
                },
                {
                  name = "Istio Control Plane Dashboard"
                },
                {
                  name = "Istio Performance Dashboard"
                },
                {
                  name = "Istio Wasm Extension Dashboard"
                }
              ]
            }
          }
        }
      }
    }
  }]
}
