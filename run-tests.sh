#!/bin/bash
set -eu -o pipefail

dotnet restore /appLibrary.Tests/appLibrary.Tests.csproj
dotnet test /appLibrary.Tests/appLibrary.Tests.csproj
