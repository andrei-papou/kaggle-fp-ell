docker build \
    --build-arg GITHUB_TOKEN="$GITHUB_TOKEN" \
    -t vscode-kaggle-fp-ell \
    -f containers/vscode/docker/Dockerfile \
    .
