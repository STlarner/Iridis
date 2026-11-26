import SwiftUI

/// The theme manager contract.
///
/// Read the manager from the environment and use it to change the active theme
/// or the forced color scheme. The manager is intentionally in-memory: an app
/// registers the themes it ships, restores the saved selection at launch and
/// then reads ``palette``. Persistence, defaults and onboarding stay app-side.
///
/// The protocol carries the package name so it does not collide with an app's
/// own theme manager. ``IridisImpl`` is the default implementation.
public protocol Iridis: AnyObject {
    /// The resolved palette for the active theme and effective color scheme.
    var palette: IridisPalette { get }
    /// The registered themes, in registration order.
    var availableThemes: [IridisTheme] { get }
    /// The theme currently selected.
    var currentTheme: IridisTheme { get }
    /// The user-forced scheme, or `nil` when the system one applies.
    var colorScheme: ColorScheme? { get }

    /// Registers a theme unless one with the same name already exists.
    func registerTheme(_ theme: IridisTheme)
    /// Selects `theme` as the active theme.
    func setTheme(_ theme: IridisTheme)
    /// Forces a color scheme, or passes `nil` to follow the system again.
    func setColorScheme(_ scheme: ColorScheme?)
    /// Records the system color scheme so the manager can follow it.
    func updateSystemColorScheme(_ scheme: ColorScheme)
    /// Applies a saved theme name and color scheme.
    func configure(themeName: String?, colorScheme: ColorScheme?)
}
