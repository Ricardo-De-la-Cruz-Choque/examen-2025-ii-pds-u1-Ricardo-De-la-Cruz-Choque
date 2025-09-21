# Imagen base de .NET SDK para construir
FROM mcr.microsoft.com/dotnet/sdk:8.0 AS build
WORKDIR /src

# Copiamos el .csproj y restauramos dependencias
COPY backend/backend.csproj ./backend/
RUN dotnet restore ./backend/backend.csproj

# Copiamos el resto del backend
COPY backend ./backend

# Publicamos en modo Release
RUN dotnet publish ./backend/backend.csproj -c Release -o /app

# Imagen final de runtime
FROM mcr.microsoft.com/dotnet/aspnet:8.0 AS runtime
WORKDIR /app
COPY --from=build /app ./

EXPOSE 8080
ENTRYPOINT ["dotnet", "backend.dll"]
