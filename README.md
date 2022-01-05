# Attributes checker for GitHub Actions
This GitHub action checks the EOL code of files in the Git repository and returns an error if it is not set correctly.

## How to use
checkout the Git repository and run this.
### Example
`.github/workflows/workflow.yml`
```yaml
jobs:
  example:
    name: example
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v2
      - name: Attributes check
        uses: yuk7/gh-action-attr-checker@v1
```

### Notes
If you have a file in the git repository that needs to have CRLF EOL code, you can use `.gitattributes` to set it.

`.gitattributes`
```
*.bat       text eol=crlf
*.cmd       text eol=crlf
```