# Setup and Instructions for using the template Docker Project

1. Create your project in GitLab. Generally this will be under the Operations group. *See Naming Conventions Below*
    1. Set Up CI/CD for your project.
1. Create your project in GitHub. *See Naming Conventions Below*
    1. Ensure that your project is part of Project42 and not under your personal projects
    1. Currently our GitLab runners run using Jordan's keys so make sure to add him (thejordanclark) as a collaborator with *at least* write privileges
    1. In GitLab -> Settings -> CI/CD, be sure to set the "git strategy for pipelines" to **clone** and not *fetch*.
1. Create your dockerhub Automated Build to point at your GitHub project. *See Naming Conventions Below*
    * Configure your build settings as appropriate
    * As part of this, you can include upstream images as build dependencies to trigger a build when they update.
1. Change your git remote from this project to your new GitLab project.
    * Because we use our CI/CD pipeline, it is important to not bypass GitLab and push straight to github.
1. Set the name of your GitHub project in the .gitlab-ci.yml file.
1. Begin overwriting the contents of this file and project to fit your needs.
1. 

## Naming Conventions
* GitLab
    * Name should be descriptive of any upstream dependencies (as necessary) and include a "-docker"
* GitHub
    * Name should be descriptive of any upstream dependencies (as necessary) and include a "-docker"
* Docker
    * Name should reflect service(s) provided by the app - similar to git repos - but **not** include "-docker" (as that is implied since it's on DockerHub)

## CI/CD

Projects are using automated build/test/deploy pipelines availabe in GitLab. This strategy requires that you enable CI/CD on your GitLab project.

### Writing/Configuring Tests

* The assumption is that downstream builds are "from" a P42 base image (centos, alpine, etc). These packages come with basic test scripts installed. To include your tests in the test coverage:
    1. Create a folder/folders in the ci_tests directory which will contain your test scripts. Please make sure these are executable files.
    1. Write your tests using good testing conventions (singular, good debugging output, etc).
    1. When deploying, you can run either all tests or just your local tests by supplying arguments to the docker run --rm ... command in the test stage of the .gitlab-ci.yml file. No arguments will run all tests including upstream.
* Available Runners
    * Multiple runners are available and can be specified or selected using the tags in .gitlab-ci.yml. Available tags are:
    * - docker
    * - ovirt
    * - ubuntu
    * - openstack
    * - coreos
    * - default

## Docker Conventions
