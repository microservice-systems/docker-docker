FROM ubuntu:20.04
ARG registry
ARG group
ARG application
ARG version
ARG revision
ARG build
ARG name
ARG description
ARG ci_project_url
ARG ci_job_url
ARG ci_pipeline_url
ARG ci_commit_branch
ARG ci_commit_tag
ARG ci_commit_sha
ARG ci_commit_message
ARG ci_commit_before_sha
ARG gitlab_user_login
ARG gitlab_user_name
ARG gitlab_user_email
ENV REGISTRY="$registry"
ENV GROUP="$group"
ENV APPLICATION="$application"
ENV VERSION="$version"
ENV REVISION="$revision"
ENV BUILD="$build"
ENV NAME="$name"
ENV DESCRIPTION="$description"
ENV CI_PROJECT_URL="$ci_project_url"
ENV CI_JOB_URL="$ci_job_url"
ENV CI_PIPELINE_URL="$ci_pipeline_url"
ENV CI_COMMIT_BRANCH="$ci_commit_branch"
ENV CI_COMMIT_TAG="$ci_commit_tag"
ENV CI_COMMIT_SHA="$ci_commit_sha"
ENV CI_COMMIT_MESSAGE="$ci_commit_message"
ENV CI_COMMIT_BEFORE_SHA="$ci_commit_before_sha"
ENV GITLAB_USER_LOGIN="$gitlab_user_login"
ENV GITLAB_USER_NAME="$gitlab_user_name"
ENV GITLAB_USER_EMAIL="$gitlab_user_email"
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
LABEL ci.project.url="$ci_project_url"
LABEL ci.job.url="$ci_job_url"
LABEL ci.pipeline.url="$ci_pipeline_url"
LABEL ci.commit.branch="$ci_commit_branch"
LABEL ci.commit.tag="$ci_commit_tag"
LABEL ci.commit.sha="$ci_commit_sha"
LABEL ci.commit.message="$ci_commit_message"
LABEL ci.commit.before.sha="$ci_commit_before_sha"
LABEL gitlab.user.login="$gitlab_user_login"
LABEL gitlab.user.name="$gitlab_user_name"
LABEL gitlab.user.email="$gitlab_user_email"
