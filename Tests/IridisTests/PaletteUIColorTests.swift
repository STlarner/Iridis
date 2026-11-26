#if canImport(UIKit)
import Testing
import UIKit

@testable import Iridis

@MainActor
@Suite("Palette UIColors")
struct PaletteUIColorTests {
    @Test("UIColor init(hex:) parses 3-digit 6-digit and 8-digit hex values")
    func uiColorInit_parsesCommonHexFormats() {
        assert(
            color: UIColor(hex: "#ABC"),
            red: 170.0 / 255.0,
            green: 187.0 / 255.0,
            blue: 204.0 / 255.0,
            alpha: 1
        )
        assert(
            color: UIColor(hex: "#123456"),
            red: 18.0 / 255.0,
            green: 52.0 / 255.0,
            blue: 86.0 / 255.0,
            alpha: 1
        )
        assert(
            color: UIColor(hex: "80112233"),
            red: 17.0 / 255.0,
            green: 34.0 / 255.0,
            blue: 51.0 / 255.0,
            alpha: 128.0 / 255.0
        )
    }

    @Test("UIColor init(hex:) falls back for invalid input")
    func uiColorInit_usesFallbackForInvalidHex() {
        assert(
            color: UIColor(hex: "invalid"),
            red: 1.0 / 255.0,
            green: 1.0 / 255.0,
            blue: 0,
            alpha: 1.0 / 255.0
        )
    }

    @Test("ColorHex.uiColor forwards into the UIColor hex initializer")
    func colorHexUIColor_usesUIColorInitializer() {
        assert(
            color: "#445566".uiColor,
            red: 68.0 / 255.0,
            green: 85.0 / 255.0,
            blue: 102.0 / 255.0,
            alpha: 1
        )
    }

    private func assert(
        color: UIColor,
        red: CGFloat,
        green: CGFloat,
        blue: CGFloat,
        alpha: CGFloat,
        tolerance: CGFloat = 0.0001
    ) {
        var resolvedRed: CGFloat = 0
        var resolvedGreen: CGFloat = 0
        var resolvedBlue: CGFloat = 0
        var resolvedAlpha: CGFloat = 0
        color.getRed(
            &resolvedRed,
            green: &resolvedGreen,
            blue: &resolvedBlue,
            alpha: &resolvedAlpha
        )

        #expect(abs(resolvedRed - red) < tolerance)
        #expect(abs(resolvedGreen - green) < tolerance)
        #expect(abs(resolvedBlue - blue) < tolerance)
        #expect(abs(resolvedAlpha - alpha) < tolerance)
    }
}
#endif
