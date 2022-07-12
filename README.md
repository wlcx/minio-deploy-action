# Minio Deploy GitHub Action

Run [minio client][] in GitHub Actions to deploy files to Minio object storage.

It uses the `mc mirror --remove --overwrite` command to deploy.

It also sets the policy of the uploaded objects to `public`, so it can be used for static serving purposes.

## Usage

Put the following step in your workflow:

```yml
- name: Minio Deploy
  uses: mamal72/minio-perfect-deploy-action@main
  with:
    endpoint: ${{ secrets.MINIO_ENDPOINT }}
    access_key: ${{ secrets.MINIO_ACCESS_KEY }}
    secret_key: ${{ secrets.MINIO_SECRET_KEY }}
    bucket: 'mybucket'
    # Optional inputs with their defaults:
    source_dir: 'public'
    target_dir: '/'
```

Workflow example:

```yml
name: Deploy

on:
  pull_request:
    types: [opened, synchronize]
  push:
    branches:
      - master

jobs:
  build:
    name: Deploy
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@

      - name: Minio Deploy
        uses: mamal72/minio-perfect-deploy-action@main
        with:
          endpoint: ${{ secrets.MINIO_ENDPOINT }}
          access_key: ${{ secrets.MINIO_ACCESS_KEY }}
          secret_key: ${{ secrets.MINIO_SECRET_KEY }}
          bucket: 'mybucket'
          source_dir: 'public'
          target_dir: '/'
```

## License

Licensed under the MIT license. See [LICENSE](LICENSE).

[minio client]: https://docs.min.io/docs/minio-client-quickstart-guide
