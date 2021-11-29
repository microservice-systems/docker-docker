FROM ubuntu:20.04
ARG registry
ARG group
ARG application
ARG version
ARG revision
ARG build
ARG name
ARG description
ARG repository
ARG repository_type
ARG job
ARG job_type
ARG ci_pipeline_url
ARG ci_commit_branch
ARG ci_commit_sha
ARG ci_commit_message
ARG ci_commit_before_sha
ARG maintainer
ARG maintainer_name
ARG maintainer_email
ENV REGISTRY="$registry"
ENV GROUP="$group"
ENV APPLICATION="$application"
ENV VERSION="$version"
ENV REVISION="$revision"
ENV BUILD="$build"
ENV NAME="$name"
ENV DESCRIPTION="$description"
ENV REPOSITORY="$repository"
ENV REPOSITORY_TYPE="$repository_type"
ENV JOB="$job"
ENV JOB_TYPE="$job_type"
ENV CI_PIPELINE_URL="$ci_pipeline_url"
ENV CI_COMMIT_BRANCH="$ci_commit_branch"
ENV CI_COMMIT_SHA="$ci_commit_sha"
ENV CI_COMMIT_MESSAGE="$ci_commit_message"
ENV CI_COMMIT_BEFORE_SHA="$ci_commit_before_sha"
ENV MAINTAINER="$maintainer"
ENV MAINTAINER_NAME="$maintainer_name"
ENV MAINTAINER_EMAIL="$maintainer_email"
ENV DEBIAN_FRONTEND="noninteractive"
ENV TZ="Etc/UTC"
RUN set -e\
 && apt-get update\
 && apt-get install -y ca-certificates curl gnupg lsb-release\
 && curl -fsSL https://download.docker.com/linux/ubuntu/gpg | gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg\
 && echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | tee /etc/apt/sources.list.d/docker.list > /dev/null\
 && apt-get update\
 && apt-cache madison docker-ce\
 && apt-get install -y docker-ce=5:$VERSION~3-0~ubuntu-focal docker-ce-cli=5:$VERSION~3-0~ubuntu-focal containerd.io
WORKDIR /root
LABEL registry="$registry"
LABEL group="$group"
LABEL application="$application"
LABEL version="$version"
LABEL revision="$revision"
LABEL build="$build"
LABEL name="$name"
LABEL description="$description"
LABEL repository="$repository"
LABEL repository.type="$repository_type"
LABEL job="$job"
LABEL job.type="$job_type"
LABEL ci.pipeline.url="$ci_pipeline_url"
LABEL ci.commit.branch="$ci_commit_branch"
LABEL ci.commit.sha="$ci_commit_sha"
LABEL ci.commit.message="$ci_commit_message"
LABEL ci.commit.before.sha="$ci_commit_before_sha"
LABEL maintainer="$maintainer"
LABEL maintainer.name="$maintainer_name"
LABEL maintainer.email="$maintainer_email"
