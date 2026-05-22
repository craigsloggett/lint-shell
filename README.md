# lint-shell

A composite action for linting shell scripts.

## Usage

```yaml
name: Lint

on: pull_request

permissions:
  contents: read

jobs:
  shellcheck:
    name: Shell
    runs-on: ubuntu-24.04
    steps:
      - name: Checkout
        uses: actions/checkout@v6

      - name: Lint Shell Scripts
        uses: craigsloggett/lint-shell@v1
```
