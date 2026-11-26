# Changelog

## 0.4.0

- Iridis is now iOS-only; the macOS platform and its build step were removed.
- Add the `iridisAppearance(_:)` view modifier: it applies a forced scheme and
  refreshes the iOS status bar when the forced or system appearance changes.

## 0.3.0

- Add the `Iridis` protocol as the manager contract and rename the concrete
  manager to `IridisImpl`. Expose `any Iridis` in the environment and DI while
  `IridisImpl(theme:)` remains the default implementation.
- `configure(themeName:colorScheme:)` is now part of the protocol.
- Rename the public value types to avoid collisions with an app's own theme
  types: `Theme` → `IridisTheme`, `Palette` → `IridisPalette`,
  `ColorHex` → `IridisColorHex`.
- Remove the unprefixed `ThemeManager` protocol. `Iridis(theme:)` requires an
  initial theme; the package ships no default theme.

## 0.2.0

- Rename the public API to avoid collisions with an app's own theme types:
  `Theme` → `IridisTheme`, `Palette` → `IridisPalette`,
  `ColorHex` → `IridisColorHex`, `ThemeManagerImpl` → `Iridis`.
- Remove the `ThemeManager` protocol. The observable `Iridis` class is the
  manager; `Iridis(theme:)` still requires an initial theme.
- Keep the environment entry app-side: the package ships no default theme.

## 0.1.0

- Initial release: `Theme`, `Palette`, `ColorHex`, `ThemeManager` and
  `ThemeManagerImpl`, with SwiftUI and UIKit hex bridges.
