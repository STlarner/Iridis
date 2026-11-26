import Observation
import SwiftUI

/// The default ``Iridis`` implementation.
///
/// The class is observable, so SwiftUI tracks the selected theme and the
/// forced color scheme without Combine plumbing.
@Observable
public final class IridisImpl: Iridis {
    private var theme: IridisTheme
    /// Always updated from the system through ``updateSystemColorScheme(_:)``.
    private var systemColorScheme: ColorScheme = .light
    /// The user-forced scheme, or `nil` when the system one applies.
    public private(set) var colorScheme: ColorScheme?
    /// The registered themes, in registration order.
    public private(set) var availableThemes: [IridisTheme] = []

    /// The resolved palette for the active theme and effective color scheme.
    public var palette: IridisPalette {
        let effective = colorScheme ?? systemColorScheme
        return effective == .dark ? theme.darkPalette : theme.lightPalette
    }

    /// The theme currently selected.
    public var currentTheme: IridisTheme { theme }

    /// Creates a manager whose initial selection is `theme`.
    ///
    /// Pass the theme the app considers its default; the package ships none.
    public init(theme: IridisTheme) {
        self.theme = theme
    }

    /// Registers a theme unless one with the same name already exists.
    public func registerTheme(_ newTheme: IridisTheme) {
        guard !availableThemes.contains(where: { $0.name == newTheme.name })
        else { return }
        availableThemes.append(newTheme)
    }

    /// Selects `newTheme` as the active theme.
    public func setTheme(_ newTheme: IridisTheme) {
        theme = newTheme
    }

    /// Forces a color scheme, or passes `nil` to follow the system again.
    public func setColorScheme(_ scheme: ColorScheme?) {
        colorScheme = scheme
    }

    /// Records the system color scheme so the manager can follow it.
    public func updateSystemColorScheme(_ scheme: ColorScheme) {
        systemColorScheme = scheme
    }

    /// Applies a saved configuration.
    ///
    /// An unknown theme name is ignored, so a theme removed from the app does
    /// not reset the user's selection to an arbitrary palette.
    public func configure(themeName: String?, colorScheme: ColorScheme?) {
        if let name = themeName,
            let saved = availableThemes.first(where: { $0.name == name })
        {
            setTheme(saved)
        }
        setColorScheme(colorScheme)
    }
}
