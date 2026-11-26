/// The complete set of semantic color roles for one appearance.
///
/// A palette describes a single color scheme. Roles are semantic rather than
/// literal, so a screen asks for `surfacePrimary` instead of a concrete color
/// and keeps working when the theme changes.
public struct IridisPalette: Sendable {
    /// The primary brand color, used for prominent actions and accents.
    public let brandPrimary: IridisColorHex
    /// A deeper brand shade for pressed states, gradients and emphasis.
    public let brandVariant: IridisColorHex
    /// The main background of a screen.
    public let surfacePrimary: IridisColorHex
    /// The background of cards and grouped rows.
    public let surfaceSecondary: IridisColorHex
    /// A subtle fill for chips, wells and decorative areas.
    public let surfaceTertiary: IridisColorHex
    /// The primary text and icon color.
    public let textPrimary: IridisColorHex
    /// The secondary text color for captions, metadata and hints.
    public let textSecondary: IridisColorHex
    /// The color of destructive actions and error text.
    public let destructive: IridisColorHex
    /// The background behind destructive content.
    public let surfaceDestructive: IridisColorHex
    /// The color of warnings and due states.
    public let warning: IridisColorHex
    /// The background behind warning content.
    public let surfaceWarning: IridisColorHex
    /// The color of success and completed states.
    public let success: IridisColorHex
    /// The background behind success content.
    public let surfaceSuccess: IridisColorHex
    /// The color of separators and outlines.
    public let border: IridisColorHex

    /// Creates a palette from its semantic color roles.
    public init(
        brandPrimary: IridisColorHex,
        brandVariant: IridisColorHex,
        surfacePrimary: IridisColorHex,
        surfaceSecondary: IridisColorHex,
        surfaceTertiary: IridisColorHex,
        textPrimary: IridisColorHex,
        textSecondary: IridisColorHex,
        destructive: IridisColorHex,
        surfaceDestructive: IridisColorHex,
        warning: IridisColorHex,
        surfaceWarning: IridisColorHex,
        success: IridisColorHex,
        surfaceSuccess: IridisColorHex,
        border: IridisColorHex
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
