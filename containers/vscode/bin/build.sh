docker build \
    --build-arg GITHUB_TOKEN="$GITHUB_TOKEN" \
    --build-arg CACHEBUST="$(date +%s)" \
    -t vscode-kaggle-fp-ell \
    -f containers/vscode/docker/Dockerfile \
    .
