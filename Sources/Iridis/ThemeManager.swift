import SwiftUI

/// Owns the active theme and resolves its palette for the effective scheme.
///
/// The manager is intentionally in-memory: an app registers the themes it
/// ships, restores the saved selection at launch and then reads ``palette``
/// from the environment. Persistence, defaults and onboarding stay app-side.
public protocol ThemeManager: AnyObject {
    /// The palette for the theme and color scheme currently in effect.
    var palette: Palette { get }
    /// The registered themes, in registration order.
    var availableThemes: [Theme] { get }
    /// The theme currently selected.
    var currentTheme: Theme { get }
    /// The user-forced color scheme, or `nil` when following the system.
    var colorScheme: ColorScheme? { get }

    /// Registers a theme unless one with the same name already exists.
    func registerTheme(_ theme: Theme)
    /// Selects a theme as the active one.
    func setTheme(_ theme: Theme)
    /// Forces a color scheme, or passes `nil` to follow the system again.
    func setColorScheme(_ scheme: ColorScheme?)
    /// Records the system color scheme so the manager can follow it.
    func updateSystemColorScheme(_ scheme: ColorScheme)
}
