import Iridis
import SwiftUI
import Testing

@MainActor
@Suite("IridisImpl")
struct IridisImplTests {
    @Test("registerTheme avoids duplicate themes and preserves order")
    func registerTheme_deduplicatesByName() {
        let sut = IridisImpl(theme: Fixtures.alpha)

        sut.registerTheme(Fixtures.alpha)
        sut.registerTheme(Fixtures.beta)
        sut.registerTheme(Fixtures.beta)

        #expect(sut.availableThemes.map(\.name) == ["Alpha", "Beta"])
    }

    @Test("palette follows the system color scheme when no override is set")
    func palette_followsSystemColorSchemeWithoutOverride() {
        let sut = IridisImpl(theme: Fixtures.alpha)

        sut.updateSystemColorScheme(.dark)

        #expect(sut.colorScheme == nil)
        #expect(
            sut.palette.surfacePrimary
                == Fixtures.alpha.darkPalette.surfacePrimary
        )
    }

    @Test("explicit color scheme overrides the system color scheme")
    func palette_usesExplicitColorSchemeOverride() {
        let sut = IridisImpl(theme: Fixtures.alpha)

        sut.updateSystemColorScheme(.dark)
        sut.setColorScheme(.light)

        #expect(sut.colorScheme == .light)
        #expect(
            sut.palette.surfacePrimary
                == Fixtures.alpha.lightPalette.surfacePrimary
        )
    }

    @Test("configure loads a saved theme and color scheme")
    func configure_appliesSavedConfiguration() {
        let sut = IridisImpl(theme: Fixtures.alpha)
        sut.registerTheme(Fixtures.alpha)
        sut.registerTheme(Fixtures.beta)

        sut.configure(themeName: "Beta", colorScheme: .dark)

        #expect(sut.currentTheme.name == "Beta")
        #expect(sut.colorScheme == .dark)
        #expect(
            sut.palette.surfacePrimary
                == Fixtures.beta.darkPalette.surfacePrimary
        )
    }

    @Test(
        "configure ignores unknown theme names and clears the color scheme when nil"
    )
    func configure_handlesUnknownValues() {
        let sut = IridisImpl(theme: Fixtures.beta)
        sut.registerTheme(Fixtures.beta)

        sut.configure(themeName: "Unknown", colorScheme: nil)

        #expect(sut.currentTheme.name == "Beta")
        #expect(sut.colorScheme == nil)
    }
}
