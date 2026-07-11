# Changelog

## [1.6.0](https://github.com/gersonrs/modern-gitops-stack-module-istio/compare/v1.5.0...v1.6.0) (2026-07-11)


### 🚀 New Features

* adjust code ([a256ab0](https://github.com/gersonrs/modern-gitops-stack-module-istio/commit/a256ab0f894be1aff400468da7ec142c768f4aeb))
* adjust code ([bc186b0](https://github.com/gersonrs/modern-gitops-stack-module-istio/commit/bc186b0aaac238ec4a265ba0cab7daa912d16131))
* adjust project ([77b8c3b](https://github.com/gersonrs/modern-gitops-stack-module-istio/commit/77b8c3bb9a1b4f54e9626b023a7b7b0cf958f34f))


### 🔥 Bug Fixes

* manage gateway certificate via argocd and break bootstrap cycle ([595b7b0](https://github.com/gersonrs/modern-gitops-stack-module-istio/commit/595b7b05662623f2294b0ca393063bca4afa23c1))
* manage gateway certificate via ArgoCD and break bootstrap cycle ([0986993](https://github.com/gersonrs/modern-gitops-stack-module-istio/commit/0986993b62fc44b4908af3ea93ecffa1644617af))

## [1.5.0](https://github.com/gersonrs/modern-gitops-stack-module-istio/compare/v1.4.0...v1.5.0) (2026-07-07)


### 🚀 New Features

* try again ([aa535a6](https://github.com/gersonrs/modern-gitops-stack-module-istio/commit/aa535a6d00d729e80a139dd1efd4dfdf20dac930))


### 🔥 Bug Fixes

* break istio gateway tls bootstrap deadlock ([45030f9](https://github.com/gersonrs/modern-gitops-stack-module-istio/commit/45030f9f8fdc4d638f372e57dfcda89a509deea8))
* break istio gateway tls bootstrap deadlock ([ff92281](https://github.com/gersonrs/modern-gitops-stack-module-istio/commit/ff9228125d38543c70eba4620a0852902da32145))

## [1.4.0](https://github.com/gersonrs/modern-gitops-stack-module-istio/compare/v1.3.0...v1.4.0) (2026-07-07)


### 🚀 New Features

* adjust code ([667c160](https://github.com/gersonrs/modern-gitops-stack-module-istio/commit/667c16022d220e7d1565063add47c853764f7026))


### 🔥 Bug Fixes

* fix apply error ([719d537](https://github.com/gersonrs/modern-gitops-stack-module-istio/commit/719d537eba5c5f6d77468d4fdb44811590461e80))

## [1.3.0](https://github.com/gersonrs/modern-gitops-stack-module-istio/compare/v1.2.0...v1.3.0) (2026-07-06)


### 🚀 New Features

* adjust conflicts ([8f38d02](https://github.com/gersonrs/modern-gitops-stack-module-istio/commit/8f38d02d5894118be05dc2ff4e61d9b10d5ef1fd))
* adjust somethings ([f37672e](https://github.com/gersonrs/modern-gitops-stack-module-istio/commit/f37672e45a2537e328bd1ace802644a3324a742a))

## [1.2.0](https://github.com/gersonrs/modern-gitops-stack-module-istio/compare/v1.1.2...v1.2.0) (2026-07-06)


### 🚀 New Features

* replace local-exec crd/cert with declarative argocd app and kubernetes manifest ([0478b39](https://github.com/gersonrs/modern-gitops-stack-module-istio/commit/0478b3972f7fa94c620f1214d13b4beafecf513f))
* replace local-exec crd/cert with declarative argocd app and kubernetes manifest ([ee6912e](https://github.com/gersonrs/modern-gitops-stack-module-istio/commit/ee6912eb8af185be3fbaf925253012f2bd92def8))


### ⚙️ Chores

* trigger release ([6360df3](https://github.com/gersonrs/modern-gitops-stack-module-istio/commit/6360df3fd8491f7cda1b2bf73d287a0e6f512c37))
* trigger release ([7813ae1](https://github.com/gersonrs/modern-gitops-stack-module-istio/commit/7813ae197811851eb66d117df0543a4f3295831a))

## [1.1.2](https://github.com/gersonrs/modern-gitops-stack-module-istio/compare/v1.1.1...v1.1.2) (2026-07-06)


### 🔥 Bug Fixes

* remove kiali and decouple gateway flow from lb ip ([e7a8981](https://github.com/gersonrs/modern-gitops-stack-module-istio/commit/e7a8981c7d564678bf47b6d31a60ef51c4c00cd2))
* remove kiali and decouple gateway flow from lb ip ([b20168b](https://github.com/gersonrs/modern-gitops-stack-module-istio/commit/b20168b2d705ac2f63993ad1e33fae487a314fc4))
* tolerate missing istio gateway loadbalancer status ([e67f92f](https://github.com/gersonrs/modern-gitops-stack-module-istio/commit/e67f92ff1006122b33aafa375651ffe780b042df))


### ⚙️ Chores

* trigger release ([c78f299](https://github.com/gersonrs/modern-gitops-stack-module-istio/commit/c78f299ffa18b90391ec16d85e86b9a4587842bb))
* trigger release ([8bf5c6c](https://github.com/gersonrs/modern-gitops-stack-module-istio/commit/8bf5c6c83a46e3ecf4d630fe59cf1523cd0658fe))

## [1.1.1](https://github.com/gersonrs/modern-gitops-stack-module-istio/compare/v1.1.0...v1.1.1) (2026-05-20)


### 🔥 Bug Fixes

* add global HTTP to HTTPS redirect route to active gateway chart ([6ada2ab](https://github.com/gersonrs/modern-gitops-stack-module-istio/commit/6ada2ab19c9508aae5774f6c80d914f9f0b744d5))
* add kiali HTTPRoute, fix hardcoded Grafana URL, remove obsolete gateway service values ([#19](https://github.com/gersonrs/modern-gitops-stack-module-istio/issues/19)) ([d73455f](https://github.com/gersonrs/modern-gitops-stack-module-istio/commit/d73455f31c4170607e1d53c7aca109feff6afd3b))
* allow base_domain passthrough in kind wrapper module ([1bce562](https://github.com/gersonrs/modern-gitops-stack-module-istio/commit/1bce5621673e39fdd2387c25b88e4a4eb950a366))
* allow base_domain passthrough in kind wrapper module ([a93fa9f](https://github.com/gersonrs/modern-gitops-stack-module-istio/commit/a93fa9f8f17f13137d084738b4e6505660173a0f))
* enable gateway deployment in kind submodule ([#15](https://github.com/gersonrs/modern-gitops-stack-module-istio/issues/15)) ([f622f15](https://github.com/gersonrs/modern-gitops-stack-module-istio/commit/f622f15ba7618c9b1da91fe94cf20d281bd2e687))
* remove redundant istio/gateway helm subchart, use Gateway API only ([#18](https://github.com/gersonrs/modern-gitops-stack-module-istio/issues/18)) ([08ace60](https://github.com/gersonrs/modern-gitops-stack-module-istio/commit/08ace609c51232c8ceeff9d94dd7dbf48bddc7d8))
* replace old Istio Gateway with Kubernetes Gateway API resource ([#17](https://github.com/gersonrs/modern-gitops-stack-module-istio/issues/17)) ([ca6b0c7](https://github.com/gersonrs/modern-gitops-stack-module-istio/commit/ca6b0c760314650f9bfee9d8acc1766bb31ca0fd))


### ⚙️ Chores

* disable kiali by default ([#20](https://github.com/gersonrs/modern-gitops-stack-module-istio/issues/20)) ([22e840f](https://github.com/gersonrs/modern-gitops-stack-module-istio/commit/22e840f84420406753f85b10f8bfd38ad7a603d2))
* remove unused legacy istio-gateway chart directory ([17c4f99](https://github.com/gersonrs/modern-gitops-stack-module-istio/commit/17c4f9943bb9643a0e7ede1a5696f7022b7cae59))
* remove unused legacy istio-gateway chart directory ([ac3fa80](https://github.com/gersonrs/modern-gitops-stack-module-istio/commit/ac3fa80209a3cae2aeba8d7ebd6b45d6e1737647))
* remove unused legacy istio-gateway chart directory ([6af29cb](https://github.com/gersonrs/modern-gitops-stack-module-istio/commit/6af29cb738da8d216214ed6619332f1ca27533b5))

## [1.1.0](https://github.com/gersonrs/modern-gitops-stack-module-istio/compare/v1.0.0...v1.1.0) (2026-05-19)


### 🚀 New Features

* add Gateway API support with HTTPRoute, Certificate, and kind submodule ([50390ca](https://github.com/gersonrs/modern-gitops-stack-module-istio/commit/50390caf790e4ae3b86b209afcc2d9df344e8b91))
* add global HTTP to HTTPS redirect HTTPRoute at gateway level ([292e3a4](https://github.com/gersonrs/modern-gitops-stack-module-istio/commit/292e3a457d9c0c494967a20b2ae621178ef0aacf))
* add kiali ([327ad5a](https://github.com/gersonrs/modern-gitops-stack-module-istio/commit/327ad5ad8b359f61c72d73d1e66c8ed07d82aed3))
* add kiali ([43c491f](https://github.com/gersonrs/modern-gitops-stack-module-istio/commit/43c491ff2b5822e8214dff77db8db5cc69f1c421))
* add kiali ([2adf046](https://github.com/gersonrs/modern-gitops-stack-module-istio/commit/2adf04682a7df992df07b3e1e989d912b9e06afd))
* add kiali ([c52374e](https://github.com/gersonrs/modern-gitops-stack-module-istio/commit/c52374eec982cb3c863d08615c6e50ae25ed8416))
* add kubectl_context variable for cloud-agnostic kubectl execution ([fb2a56e](https://github.com/gersonrs/modern-gitops-stack-module-istio/commit/fb2a56e2d5506b3693a6f4d6c6214576466a4f85))
* add new ingress gateway resources ([fd66fb8](https://github.com/gersonrs/modern-gitops-stack-module-istio/commit/fd66fb8fdbd46a5e351d094c8f20b94ab6f856d5))
* adjust project ([fa6d036](https://github.com/gersonrs/modern-gitops-stack-module-istio/commit/fa6d03687ea198e8bd3bd1dcb5a3c10f2d71a9d3))
* config kiali ([7a3ed39](https://github.com/gersonrs/modern-gitops-stack-module-istio/commit/7a3ed39a86c8c85662c3aa8c188875629d5ded8c))
* config kiali ([2980971](https://github.com/gersonrs/modern-gitops-stack-module-istio/commit/298097183ae5a4f55c62e67c8bd0258bf4230702))
* enable HTTPS listener on Gateway and auto-create TLS certificate in kind ([5305cef](https://github.com/gersonrs/modern-gitops-stack-module-istio/commit/5305cef71b65399cfb9a5df8eff36413ccbb57e6))
* update istio to 1.24.3 ([12d81a8](https://github.com/gersonrs/modern-gitops-stack-module-istio/commit/12d81a83afcee54ee977a6438389280556e558b0))
* update Istio to 1.24.3, add Kiali and new ingress gateway resources ([5e27480](https://github.com/gersonrs/modern-gitops-stack-module-istio/commit/5e274805ab5103ba0e4910a2e2e8c72bc936f41b))


### 🔥 Bug Fixes

* add ignore difference to fix outofsync ([4a511cc](https://github.com/gersonrs/modern-gitops-stack-module-istio/commit/4a511ccaccb04442831a40176116dac0e778a62d))
* add ignore difference to fix outofsync ([d233dd6](https://github.com/gersonrs/modern-gitops-stack-module-istio/commit/d233dd61e7471b2f2d644501bb1e8bc852dc948f))
* add ignore difference to fix outofsync ([4e9bcfd](https://github.com/gersonrs/modern-gitops-stack-module-istio/commit/4e9bcfdd4726b32eefc04d3e41d77c6d028271d7))
* argocd provider version ([0aeae84](https://github.com/gersonrs/modern-gitops-stack-module-istio/commit/0aeae849d6e128d236d784daf8273c35c44431cc))
* avoid invalid '*.*' Gateway hostname when base_domain is empty ([2c3c9a0](https://github.com/gersonrs/modern-gitops-stack-module-istio/commit/2c3c9a0170916aaa8ff78051587a53591d3ea8f0))
* chart name ([9ced5d3](https://github.com/gersonrs/modern-gitops-stack-module-istio/commit/9ced5d3de43eea2bb14a70092d25c9a5756b78f7))
* chart name ([b5102c9](https://github.com/gersonrs/modern-gitops-stack-module-istio/commit/b5102c955475b35d921cc497b88737ed276b2425))
* chart name ([39063b6](https://github.com/gersonrs/modern-gitops-stack-module-istio/commit/39063b684fe46f27ce80476ed3979fec46579aaf))
* escape bash parameter expansion in Terraform heredoc ([4eed61d](https://github.com/gersonrs/modern-gitops-stack-module-istio/commit/4eed61dcb03ac33a3797154e35e2f1544ff9e887))
* fix templates folder name ([a063260](https://github.com/gersonrs/modern-gitops-stack-module-istio/commit/a063260f264691e1aaa4a7691c1f35b6a3e12472))
* install Gateway API CRDs reliably on clean clusters ([a94ca3d](https://github.com/gersonrs/modern-gitops-stack-module-istio/commit/a94ca3da4ad639d8f87584bb520559e2e3fc3da6))
* make https listener conditional on domain being set to avoid missing TLS secret ([7ca7180](https://github.com/gersonrs/modern-gitops-stack-module-istio/commit/7ca7180feebc495edbc42b97df5a49cf279678a6))
* read istio-gateway-istio service IP for nip.io base_domain in kind submodule ([e1dfcc8](https://github.com/gersonrs/modern-gitops-stack-module-istio/commit/e1dfcc863dc0fa57caa279ef7d279ba6e44b705c))
* remove finalizers ([0ad79a6](https://github.com/gersonrs/modern-gitops-stack-module-istio/commit/0ad79a6c3fe7b793bfb853c924471676276dae3f))
* remove istio/gateway Helm dependency - use Gateway API only (single gateway at 172.18.0.101) ([b746e8a](https://github.com/gersonrs/modern-gitops-stack-module-istio/commit/b746e8a12a909079eaa1b66666d0072579dbcbe4))
* rerun Gateway API CRD bootstrap on version changes ([2aa87ed](https://github.com/gersonrs/modern-gitops-stack-module-istio/commit/2aa87edf530879abdabe25905dfdcfd9e9725e4e))
* resolve merge conflicts keeping kiali, wait_for_gateway_service and gateway_config ([d6c8d1d](https://github.com/gersonrs/modern-gitops-stack-module-istio/commit/d6c8d1dffc539be96492d8f28e281c3a951c98ee))
* update release-please workflow to use PROJECT_APP_PRIVATE_KEY secret ([01286c0](https://github.com/gersonrs/modern-gitops-stack-module-istio/commit/01286c09206283390b6e36c352da96db33620671))
* update release-please workflow to use PROJECT_APP_PRIVATE_KEY secret ([33a138b](https://github.com/gersonrs/modern-gitops-stack-module-istio/commit/33a138b531d4cd2a1efc9e8cab0acceb3a444a0f))
* wait for istio-gateway-istio service to have external IP before reading it ([5bee71b](https://github.com/gersonrs/modern-gitops-stack-module-istio/commit/5bee71bb9c44eb005cc24e431c592a34f324186e))


### 🎨 Code Style

* fix terraform fmt alignment in locals.tf ([3544119](https://github.com/gersonrs/modern-gitops-stack-module-istio/commit/3544119de9901d4285dc8830ea41c1b0aaad691f))


### ⚙️ Chores

* remove istio/gateway chart lock and tgz dependency ([ba1a844](https://github.com/gersonrs/modern-gitops-stack-module-istio/commit/ba1a8445e4728ad7f379c844dea64b5c966743bf))


### ⌨️ Code Refactoring

* adjust istio code ([1bd6546](https://github.com/gersonrs/modern-gitops-stack-module-istio/commit/1bd65464e53f7c04cdeb95c4f80b76aff57dbd24))
* adjust istio code ([edbc708](https://github.com/gersonrs/modern-gitops-stack-module-istio/commit/edbc7088cddd594144ce6510e2b5021182ed0b07))
* adjust istio configmap ([334680a](https://github.com/gersonrs/modern-gitops-stack-module-istio/commit/334680a823c82492a34acc3a534a93b84406c8a9))
* adjust istio configmap ([3b31ab4](https://github.com/gersonrs/modern-gitops-stack-module-istio/commit/3b31ab4651a8d73f13dd9daa7691edf4c1f45c68))
* recofigure istio istiod configmap ([b2b1b53](https://github.com/gersonrs/modern-gitops-stack-module-istio/commit/b2b1b5341e436041162b0a85ade81cbb2dda04a6))
* remove namespace ([e28c1ee](https://github.com/gersonrs/modern-gitops-stack-module-istio/commit/e28c1eebaef6e9c74be33ce591ea68ef78d5f2b3))

## [2.4.0](https://github.com/GersonRS/modern-gitops-stack-module-minio/compare/v2.3.0...v2.4.0) (2024-05-01)


### 🚀 New Features

* add pre-commit, config release-please workflow and adjust add-to-project workflow ([1297a4d](https://github.com/GersonRS/modern-gitops-stack-module-minio/commit/1297a4d3c500c07a0975f4f9b31b2ee5846ce1d1))
* finish configuration ([42d3c3b](https://github.com/GersonRS/modern-gitops-stack-module-minio/commit/42d3c3bb399e003ce95513457b9ceae1be269719))
* include page in documentation ([d6d495d](https://github.com/GersonRS/modern-gitops-stack-module-minio/commit/d6d495d8d0ca4fbd587aa0acd2fe8955850a0d94))
* module modularization ([f0f6f48](https://github.com/GersonRS/modern-gitops-stack-module-minio/commit/f0f6f48b11ab448280f1c809e4ddfbb781a4a495))
* module modularization ([93ddc18](https://github.com/GersonRS/modern-gitops-stack-module-minio/commit/93ddc1805cc5cb6eabf8e18c6602d3e73a5543ee))
* Update minio config and change mode to distributed mode ([cca6ff1](https://github.com/GersonRS/modern-gitops-stack-module-minio/commit/cca6ff1eed86264a89d44fd8fa314af6d8e6a87e))


### 🔥 Bug Fixes

* adjust module target revision ([2479aea](https://github.com/GersonRS/modern-gitops-stack-module-minio/commit/2479aea5459a3a09002061efb8c37b4084c5dc14))


### 📚 Documentation

* **pull_request:** update pull request template ([72f8b15](https://github.com/GersonRS/modern-gitops-stack-module-minio/commit/72f8b1535bf1c7e2f3f081debf90cea34b3fc5ef))
* **terraform-docs:** generate docs and write to README.adoc ([9477c8e](https://github.com/GersonRS/modern-gitops-stack-module-minio/commit/9477c8ea11903f69fda72ec51b3cc13db703b93d))
* **terraform-docs:** generate docs and write to README.adoc ([d7e9806](https://github.com/GersonRS/modern-gitops-stack-module-minio/commit/d7e9806c63124b66dd3d25fa5259a997cc280860))


### ⚙️ Chores

* release 1.0.0 ([1aa4277](https://github.com/GersonRS/modern-gitops-stack-module-minio/commit/1aa4277287af68ac86105686a6bb12ce1feaad2e))
* release 1.1.0 ([bba3ae9](https://github.com/GersonRS/modern-gitops-stack-module-minio/commit/bba3ae9232b9f0c5e5dc818b12333b5e0b1f094d))
* release 1.2.0 ([4e2f211](https://github.com/GersonRS/modern-gitops-stack-module-minio/commit/4e2f2114331fd6b1aceecc449092a65bb91b7f44))

## [1.2.0](https://github.com/GersonRS/modern-gitops-stack-module-minio/compare/v1.1.0...v1.2.0) (2024-04-28)


### Features

* Update minio config and change mode to distributed mode ([cca6ff1](https://github.com/GersonRS/modern-gitops-stack-module-minio/commit/cca6ff1eed86264a89d44fd8fa314af6d8e6a87e))

## [1.1.0](https://github.com/GersonRS/modern-gitops-stack-module-minio/compare/v1.0.0...v1.1.0) (2024-04-26)


### Features

* include page in documentation ([d6d495d](https://github.com/GersonRS/modern-gitops-stack-module-minio/commit/d6d495d8d0ca4fbd587aa0acd2fe8955850a0d94))


### Bug Fixes

* adjust module target revision ([2479aea](https://github.com/GersonRS/modern-gitops-stack-module-minio/commit/2479aea5459a3a09002061efb8c37b4084c5dc14))

## 1.0.0 (2024-04-24)


### Features

* finish configuration ([42d3c3b](https://github.com/GersonRS/modern-gitops-stack-module-minio/commit/42d3c3bb399e003ce95513457b9ceae1be269719))
* module modularization ([f0f6f48](https://github.com/GersonRS/modern-gitops-stack-module-minio/commit/f0f6f48b11ab448280f1c809e4ddfbb781a4a495))
* module modularization ([93ddc18](https://github.com/GersonRS/modern-gitops-stack-module-minio/commit/93ddc1805cc5cb6eabf8e18c6602d3e73a5543ee))
