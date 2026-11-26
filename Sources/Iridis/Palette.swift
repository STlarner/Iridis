/// The complete set of semantic color roles for one appearance.
///
/// A palette describes a single color scheme. Roles are semantic rather than
/// literal, so a screen asks for `surfacePrimary` instead of a concrete color
/// and keeps working when the theme changes.
public struct Palette: Sendable {
    /// The primary brand color, used for prominent actions and accents.
    public let brandPrimary: ColorHex
    /// A deeper brand shade for pressed states, gradients and emphasis.
    public let brandVariant: ColorHex
    /// The main background of a screen.
    public let surfacePrimary: ColorHex
    /// The background of cards and grouped rows.
    public let surfaceSecondary: ColorHex
    /// A subtle fill for chips, wells and decorative areas.
    public let surfaceTertiary: ColorHex
    /// The primary text and icon color.
    public let textPrimary: ColorHex
    /// The secondary text color for captions, metadata and hints.
    public let textSecondary: ColorHex
    /// The color of destructive actions and error text.
    public let destructive: ColorHex
    /// The background behind destructive content.
    public let surfaceDestructive: ColorHex
    /// The color of warnings and due states.
    public let warning: ColorHex
    /// The background behind warning content.
    public let surfaceWarning: ColorHex
    /// The color of success and completed states.
    public let success: ColorHex
    /// The background behind success content.
    public let surfaceSuccess: ColorHex
    /// The color of separators and outlines.
    public let border: ColorHex

    /// Creates a palette from its semantic color roles.
    public init(
        brandPrimary: ColorHex,
        brandVariant: ColorHex,
        surfacePrimary: ColorHex,
        surfaceSecondary: ColorHex,
        surfaceTertiary: ColorHex,
        textPrimary: ColorHex,
        textSecondary: ColorHex,
        destructive: ColorHex,
        surfaceDestructive: ColorHex,
        warning: ColorHex,
        surfaceWarning: ColorHex,
        success: ColorHex,
        surfaceSuccess: ColorHex,
        border: ColorHex
    ) {
        self.brandPrimary = brandPrimary
        self.brandVariant = brandVariant
        self.surfacePrimary = surfacePrimary
        self.surfaceSecondary = surfaceSecondary
        self.surfaceTertiary = surfaceTertiary
        self.textPrimary = textPrimary
        self.textSecondary = textSecondary
        self.destructive = destructive
        self.surfaceDestructive = surfaceDestructive
        self.warning = warning
        self.surfaceWarning = surfaceWarning
        self.success = success
        self.surfaceSuccess = surfaceSuccess
        self.border = border
    }
}
