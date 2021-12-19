# SequenceApp


[![Docker Image CI](https://github.com/VikasBaweja20/SequenceApp/actions/workflows/dotnet.yml/badge.svg)](https://github.com/VikasBaweja20/SequenceApp/actions/workflows/dotnet.yml)


This App takes one string input of any number of integers separated by single whitespace. The function then outputs the longest increasing subsequence (increased by any number) present in that sequence. If more than 1 sequence exists with the longest length, output the earliest one.

### Test 1
For a sequence 9 2 4 6 8 1 3 5
It will return 2 4 6 8

### Test 2
For a sequence 9 2 4 6 8 1 3 5 7
It will return 2 4 6 8

### Test 3
For a sequence 9 2 4 6 1 3 5 7
It will return 1 3 5 7

## Continous Integration
Integrated a CI pipeline with this project using GitHub Actions that executes all the tests and run test for the project. Actions will build the Docker image and push it to AWS ECR(Elastic Container Registry) public repo.


## Next Step
Create Docker Compose and use the public image

## Issues Discovered and Resolved
Docker push was not able to find the correct registry with *${{ steps.login-ecr.outputs.registry }}* and kept failing. Thanks for AWS CloudTrail events, this was resolved using *public.ecr.aws*
