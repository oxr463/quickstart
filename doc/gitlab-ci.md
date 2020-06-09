# GitLab CI/CD

The timeout setting for the pipeline should be set to four hours so that
portage has time to compile all of the required dependencies:

```yml
Timeout: 4h
```

## Reference

- [GitLab Settings Pipeline Timeout](https://gitlab.com/help/ci/pipelines/settings#timeout)
