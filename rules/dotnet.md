# .NET / C# Rules

## Signals
`*.csproj`, `*.sln`, `*.cs` files, `global.json`, `nuget.config`

## CLAUDE.md sections to include

### Commands
```powershell
dotnet build
dotnet run --project <MainProject>
dotnet test
dotnet format
```

### Conventions
- PascalCase for public members, _camelCase for private fields
- Interfaces prefixed with I (IService, IRepository)
- Async/await for all I/O -- never block the UI thread (desktop apps)
- Dependency injection via built-in DI container
- Dispose pattern for unmanaged resources (IDisposable)
- Nullable reference types enabled

### Conventions (WPF/Desktop)
- MVVM pattern: Views, ViewModels, Models
- INotifyPropertyChanged for ViewModel properties
- Data binding for all UI state -- no direct UI manipulation from code-behind
- Background tasks via Task.Run or BackgroundWorker, never on UI thread

### Prohibitions
- NEVER block the UI thread with synchronous I/O
- NEVER use Thread.Sleep in UI code -- use Task.Delay
- NEVER commit user secrets or connection strings

## Permissions
```
Bash(dotnet build:*), Bash(dotnet test:*), Bash(dotnet format:*), Bash(dotnet run:*)
```

## Deny
```
Bash(dotnet publish:*)
```

## Formatting hook
`dotnet format --include "$FILE_PATH"`
