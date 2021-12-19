FROM mcr.microsoft.com/dotnet/sdk:5.0 AS base

WORKDIR /appLibrary
COPY . .

RUN dotnet restore

RUN dotnet test

# run tests on docker run
CMD ["dotnet", "test"]
