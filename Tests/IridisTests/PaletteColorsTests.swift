#if canImport(UIKit)
import SwiftUI
import Testing
import UIKit

@testable import Iridis

@MainActor
@Suite("Palette Colors")
struct PaletteColorsTests {
    @Test("Color init(hex:) parses 3-digit 6-digit and 8-digit hex values")
    func colorInit_parsesCommonHexFormats() {
        assert(
            color: Color(hex: "#0F8"),
            red: 0,
            green: 1,
            blue: 136.0 / 255.0,
            alpha: 1
        )
        assert(
            color: Color(hex: "#112233"),
            red: 17.0 / 255.0,
            green: 34.0 / 255.0,
            blue: 51.0 / 255.0,
            alpha: 1
        )
        assert(
            color: Color(hex: "CC336699"),
            red: 51.0 / 255.0,
            green: 102.0 / 255.0,
            blue: 153.0 / 255.0,
            alpha: 204.0 / 255.0
        )
    }

    @Test(
        "Color init(hex:) falls back to the default components for invalid input"
    )
    func colorInit_usesFallbackForInvalidHex() {
        assert(
            color: Color(hex: "invalid"),
            red: 1.0 / 255.0,
            green: 1.0 / 255.0,
            blue: 0,
            alpha: 1.0 / 255.0
        )
    }

    @Test("ColorHex.color forwards into the Color hex initializer")
    func colorHexColor_usesColorInitializer() {
        assert(
            color: "#445566".color,
            red: 68.0 / 255.0,
            green: 85.0 / 255.0,
            blue: 102.0 / 255.0,
            alpha: 1
        )
    }

    private func assert(
        color: Color,
        red: CGFloat,
        green: CGFloat,
        blue: CGFloat,
        alpha: CGFloat,
        tolerance: CGFloat = 0.0001
    ) {
        let uiColor = UIColor(color)
        var resolvedRed: CGFloat = 0
        var resolvedGreen: CGFloat = 0
        var resolvedBlue: CGFloat = 0
        var resolvedAlpha: CGFloat = 0
        uiColor.getRed(
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
