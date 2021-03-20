FROM devopsinfra/docker-terragrunt:latest as terra
FROM docker:latest
COPY --from=terra /usr/bin/terragrunt /bin/
COPY --from=terra /usr/bin/terraform /bin/
