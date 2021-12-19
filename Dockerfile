FROM mcr.microsoft.com/dotnet/sdk:5.0 AS base

WORKDIR /appLibrary
COPY . .

RUN dotnet restore

WORKDIR /appLibrary.Tests
COPY . .

RUN dotnet restore

# run tests on docker build
RUN dotnet test

# run tests on docker run
ENTRYPOINT ["dotnet", "appLibrary.Tests.dll"]
