import Iridis
import Testing

@Suite("Palette")
struct PaletteTests {
    @Test("initializer stores all palette values")
    func init_storesAllValues() {
        let palette = Palette(
            brandPrimary: "#111111",
            brandVariant: "#222222",
            surfacePrimary: "#333333",
            surfaceSecondary: "#444444",
            surfaceTertiary: "#555555",
            textPrimary: "#666666",
            textSecondary: "#777777",
            destructive: "#888888",
            surfaceDestructive: "#999999",
            warning: "#AAAAAA",
            surfaceWarning: "#BBBBBB",
            success: "#CCCCCC",
            surfaceSuccess: "#DDDDDD",
            border: "#EEEEEE"
        )

        #expect(palette.brandPrimary == "#111111")
        #expect(palette.brandVariant == "#222222")
        #expect(palette.surfacePrimary == "#333333")
        #expect(palette.surfaceSecondary == "#444444")
        #expect(palette.surfaceTertiary == "#555555")
        #expect(palette.textPrimary == "#666666")
        #expect(palette.textSecondary == "#777777")
        #expect(palette.destructive == "#888888")
        #expect(palette.surfaceDestructive == "#999999")
        #expect(palette.warning == "#AAAAAA")
        #expect(palette.surfaceWarning == "#BBBBBB")
        #expect(palette.success == "#CCCCCC")
        #expect(palette.surfaceSuccess == "#DDDDDD")
        #expect(palette.border == "#EEEEEE")
    }
}
