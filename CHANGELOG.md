# Changelog

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
