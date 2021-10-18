FROM ghcr.io/rajbos/actions-marketplace/powershell:7

COPY /powerbiactions/ /src/

ENTRYPOINT ["pwsh", "/src/run-task.ps1"]