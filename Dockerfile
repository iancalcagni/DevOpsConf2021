FROM ghcr.io/rajbos/actions-marketplace/powershell:7

COPY /pipelines/ /src/

ENTRYPOINT ["pwsh", "/src/run-wrap.ps1"]