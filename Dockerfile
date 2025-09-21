# Imagen base para .NET
FROM mcr.microsoft.com/dotnet/aspnet:8.0 AS base
WORKDIR /app
EXPOSE 8080

# Imagen de SDK para build
FROM mcr.microsoft.com/dotnet/sdk:8.0 AS build
WORKDIR /src

# Copiamos el archivo .csproj y restauramos dependencias
COPY backend/backend.csproj ./backend/
RUN dotnet restore ./backend/backend.csproj

# Copiamos el resto del backend
COPY backend ./backend
WORKDIR /src/backend
RUN dotnet publish -c Release -o /app/publish

# Imagen final
FROM base AS final
WORKDIR /app
COPY --from=build /app/publish .
ENTRYPOINT ["dotnet", "backend.dll"]