# Using Iridis

Define the themes your app ships, register them with an `Iridis` manager,
expose the manager through the environment, and read semantic colors from
views.

## Define a theme

An `IridisPalette` holds the semantic roles of a single appearance. An
`IridisTheme` pairs a light and a dark palette under a name. Define the themes
an app ships in the app target, not in the package.

<!-- swift-example: guide -->

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

## Create the manager

```swift
let iridis = Iridis(theme: .defaultTheme())
iridis.registerTheme(.defaultTheme())
iridis.setColorScheme(.dark)
```

`setColorScheme(_:)` forces a scheme for the app; pass `nil` to follow the
system again. `updateSystemColorScheme(_:)` records the scheme reported by the
system and is what makes `nil` work.

## Expose the manager

Declare the environment entry in the app so the default value is one of the
app's themes. Iridis ships no default theme on purpose.

```swift
extension EnvironmentValues {
    @Entry var theme: Iridis = Iridis(theme: .defaultTheme())
}
```

## Read colors from a view

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

<!-- /swift-example -->

Use `IridisColorHex.uiColor` when a UIKit API needs a color, for example an
appearance proxy. The bridge is available wherever UIKit is available.

## Persist the selection

Iridis is in-memory only. Save the selected theme name and the forced color
scheme with the app's own settings, then restore them at launch with
`configure(themeName:colorScheme:)`. The method ignores an unknown theme name,
so removing a theme does not silently reset the user's choice.
