import SwiftUI
import UIKit

/// Appearance helpers for SwiftUI views.
extension View {
    /// Applies `scheme` to the whole window and keeps the status bar in sync.
    ///
    /// Prefer this over `preferredColorScheme(_:)` when the value comes from an
    /// ``Iridis`` manager. The modifier sets the window style, so sheets and
    /// modals inherit it without extra code, and refreshes the status bar when
    /// the preference changes back to `nil` or the system appearance changes.
    /// - Parameter scheme: The forced scheme, or `nil` to follow the system.
    public func iridisAppearance(_ scheme: ColorScheme?) -> some View {
        modifier(IridisAppearanceModifier(scheme: scheme))
    }
}

@MainActor
private struct IridisAppearanceModifier: ViewModifier {
    let scheme: ColorScheme?
    @Environment(\.colorScheme) private var systemScheme

    func body(content: Content) -> some View {
        content
            .preferredColorScheme(scheme)
            .onChange(of: scheme, initial: true) { _, _ in
                syncWindowAppearance()
            }
            .onChange(of: systemScheme, initial: true) { _, _ in
                syncWindowAppearance()
            }
    }

    private func syncWindowAppearance() {
        guard
            let scene = UIApplication.shared.connectedScenes
                .compactMap({ $0 as? UIWindowScene })
                .first(where: { $0.activationState == .foregroundActive }),
            let window = scene.windows.first(where: \.isKeyWindow)
                ?? scene.windows.first
        else { return }

        if let scheme {
            window.overrideUserInterfaceStyle =
                scheme == .dark ? .dark : .light
        } else {
            // `preferredColorScheme(nil)` leaves the previous style behind.
            window.overrideUserInterfaceStyle = .unspecified
        }

        var controller = window.rootViewController
        while let presented = controller?.presentedViewController {
            controller = presented
        }
        controller?.setNeedsStatusBarAppearanceUpdate()
    }
}
