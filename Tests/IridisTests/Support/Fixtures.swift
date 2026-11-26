import Iridis

enum Fixtures {
    static let alpha = IridisTheme(
        name: "Alpha",
        lightPalette: palette(
            brand: "#A1A1A1",
            surface: "#F1F1F1",
            text: "#111111",
            state: "#DD1111",
            border: "#C1C1C1"
        ),
        darkPalette: palette(
            brand: "#A2A2A2",
            surface: "#121212",
            text: "#F2F2F2",
            state: "#DD2222",
            border: "#323232"
        )
    )

    static let beta = IridisTheme(
        name: "Beta",
        lightPalette: palette(
            brand: "#B1B1B1",
            surface: "#F3F3F3",
            text: "#131313",
            state: "#33DD33",
            border: "#C3C3C3"
        ),
        darkPalette: palette(
            brand: "#B2B2B2",
            surface: "#141414",
            text: "#F4F4F4",
            state: "#44DD44",
            border: "#343434"
        )
    )

    private static func palette(
        brand: String,
        surface: String,
        text: String,
        state: String,
        border: String
    ) -> IridisPalette {
        IridisPalette(
            brandPrimary: brand,
            brandVariant: brand,
            surfacePrimary: surface,
            surfaceSecondary: surface,
            surfaceTertiary: surface,
            textPrimary: text,
            textSecondary: text,
            destructive: state,
            surfaceDestructive: state,
            warning: state,
            surfaceWarning: state,
            success: state,
            surfaceSuccess: state,
            border: border
        )
    }
}
