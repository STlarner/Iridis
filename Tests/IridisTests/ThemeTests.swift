import Iridis
import Testing

@Suite("Theme")
struct ThemeTests {
    @Test("initializer stores the name and both palettes")
    func init_storesNameAndPalettes() {
        let theme = Theme(
            name: "Alpha",
            lightPalette: Fixtures.alpha.lightPalette,
            darkPalette: Fixtures.alpha.darkPalette
        )

        #expect(theme.name == "Alpha")
        #expect(theme.lightPalette.surfacePrimary == "#F1F1F1")
        #expect(theme.darkPalette.surfacePrimary == "#121212")
    }
}
