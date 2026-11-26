/// A named pair of light and dark palettes.
///
/// A theme is the unit an app exposes to the user: one name, two palettes.
/// Build the themes an app ships in the app itself and register them with a
/// ``ThemeManager``; the package deliberately ships no brand colors.
public struct Theme: Sendable {
    /// The name that identifies the theme to the user and in persisted settings.
    public let name: String
    /// The palette used when the effective color scheme is light.
    public let lightPalette: Palette
    /// The palette used when the effective color scheme is dark.
    public let darkPalette: Palette

    /// Creates a theme from a name and its two palettes.
    public init(name: String, lightPalette: Palette, darkPalette: Palette) {
        self.name = name
        self.lightPalette = lightPalette
        self.darkPalette = darkPalette
    }
}
