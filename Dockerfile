FROM mcr.microsoft.com/dotnet/core/sdk:3.1.100
COPY . /app
WORKDIR /app
RUN dotnet publish -c Release -o out
COPY ./northwind.db /app/out
COPY ./northwind.sql /app/out

ENV ASPNETCORE_URLS http://*:5000
WORKDIR /app/out

ENTRYPOINT ["dotnet", "LatestBlazor.dll"]
