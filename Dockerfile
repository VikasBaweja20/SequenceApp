FROM mcr.microsoft.com/dotnet/sdk:5.0 AS base

WORKDIR /appLibrary
COPY . .

RUN dotnet restore

FROM build AS testrunner
WORKDIR /appLibrary/appLibrary.Tests
CMD ["dotnet", "test", "--logger:trx"]

# run the unit tests
FROM build AS test
WORKDIR /appLibrary/appLibrary.Tests
RUN dotnet test --logger:trx

FROM build AS publish
WORKDIR /appLibrary/appLibrary.Tests
RUN dotnet publish -c Release -o out

# run tests on docker run
ENTRYPOINT ["dotnet", "appLibrary.Tests.dll"]
