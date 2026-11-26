# Iridis

Theme and palette management for SwiftUI.

An `IridisTheme` pairs a light and a dark `IridisPalette`. The `Iridis`
protocol is the manager contract; `IridisImpl` is the default observable
implementation. The package ships no brand colors and no persistence: the app
defines its palettes, registers its themes, and stores the selection.

Public types carry the package name so they do not collide with an app's own
`Theme`, `Palette` or theme manager.

## Features

- Semantic `IridisPalette` roles shared by light and dark appearances.
- Named `IridisTheme` values, with a light and a dark palette.
- `Iridis` protocol with the observable `IridisImpl` implementation.
- Automatic color scheme, plus an optional user-forced scheme.
- Hex values bridged to SwiftUI `Color` and UIKit `UIColor`.
- No globals, no storage, no app-specific copy.

## Requirements

Swift 6.2 or later. iOS 18 or later, macOS 15 or later.

## Installation

Add `https://github.com/STlarner/Iridis.git` as an Xcode package dependency
and select the `Iridis` product. For a SwiftPM project:

```swift
.package(url: "https://github.com/STlarner/Iridis.git", exact: "0.3.0")
```

## Quick start

### 1. Define a theme

A palette holds the semantic roles of one appearance; a theme pairs the light
and dark palettes under a name.

<!-- swift-example: quick-start -->

```swift
extension IridisTheme {
    static func defaultTheme() -> IridisTheme {
        let light = IridisPalette(
            brandPrimary: "#E07A60",
            brandVariant: "#C4614A",
            surfacePrimary: "#FBF7F3",
            surfaceSecondary: "#FFFFFF",
            surfaceTertiary: "#F2EDE6",
            textPrimary: "#1A1614",
            textSecondary: "#6B5F57",
            destructive: "#D64046",
            surfaceDestructive: "#F7E6E7",
            warning: "#F4A261",
            surfaceWarning: "#FDF0E1",
            success: "#3D9A70",
            surfaceSuccess: "#E7F3ED",
            border: "#E0D8D0"
        )
        let dark = IridisPalette(
            brandPrimary: "#E07A60",
            brandVariant: "#C4614A",
            surfacePrimary: "#1B1712",
            surfaceSecondary: "#2A2421",
            surfaceTertiary: "#332E29",
            textPrimary: "#F5F0EC",
            textSecondary: "#9C9087",
            destructive: "#E15559",
            surfaceDestructive: "#3D1F21",
            warning: "#F4A261",
            surfaceWarning: "#422C1B",
            success: "#4EB882",
            surfaceSuccess: "#1E3427",
            border: "#5C524B"
        )
        return IridisTheme(
            name: "Terracotta",
            lightPalette: light,
            darkPalette: dark
        )
    }
}
```

### 2. Create the manager

The initial theme is required: the package has no default to fall back to.
Register every other theme the app offers, then select the one to show.

```swift
let iridis = IridisImpl(theme: .defaultTheme())
iridis.registerTheme(.defaultTheme())
iridis.setTheme(.defaultTheme())
```

### 3. Expose the manager to SwiftUI

Declare the environment entry in the app, with one of the app's themes as the
default value.

```swift
extension EnvironmentValues {
    @Entry var theme: any Iridis = IridisImpl(theme: .defaultTheme())
}
```

### 4. Read colors from a view

```swift
struct ThemedCard: View {
    @Environment(\.theme) private var theme

    var body: some View {
        Text("Surface")
            .padding()
            .background(theme.palette.surfaceSecondary.color)
            .foregroundStyle(theme.palette.textPrimary.color)
    }
}
```

### 5. Follow the system or force a scheme

```swift
iridis.setColorScheme(.dark)
iridis.setColorScheme(nil)
iridis.updateSystemColorScheme(.light)
```

`setColorScheme(_:)` forces a scheme; `nil` restores automatic mode.
`updateSystemColorScheme(_:)` records the scheme reported by the system, which
is the one automatic mode follows.

### 6. Restore a saved selection

Iridis keeps the selection in memory. Persist the theme name and the forced
color scheme with the app's own settings, then restore them at launch.

```swift
let savedThemeName: String? = "Terracotta"
let savedColorScheme: ColorScheme? = .dark

iridis.configure(
    themeName: savedThemeName,
    colorScheme: savedColorScheme
)
```

`configure(themeName:colorScheme:)` ignores an unknown theme name, so a theme
removed from the app does not reset the user's choice.

<!-- /swift-example -->

## UIKit

Bridge a hex value to UIKit when an appearance proxy or a UIKit control needs
a color.

```swift
import UIKit

let border = "#E0D8D0".uiColor
```

## Documentation

The API reference and the usage guide follow the `main` branch on GitHub Pages:
<https://stlarner.github.io/Iridis/>.

## License

Iridis is available under the MIT license. See `LICENSE`.
