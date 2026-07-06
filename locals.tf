locals {
  helm_values = [{
    istiod = {
      profile = "ambient"
      env = {
        PILOT_JWT_PUB_KEY_REFRESH_INTERVAL = "1m"
        ENABLE_DEBUG_ON_HTTP               = false
      }

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
    gateway_config = {
      name           = "istio-gateway"
      cluster_issuer = var.cluster_issuer
    }
  }]
}
