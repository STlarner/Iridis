import SwiftUI
import UIKit

/// Appearance helpers for SwiftUI views.
extension View {
    /// Applies `scheme` to this presentation and keeps the status bar in sync.
    ///
    /// Prefer this over `preferredColorScheme(_:)` when the value comes from an
    /// ``Iridis`` manager. SwiftUI does not refresh the status bar when the
    /// preference changes back to `nil`, nor when the system appearance changes
    /// while the manager follows it.
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
                refreshStatusBarAppearance()
            }
            .onChange(of: systemScheme, initial: true) { _, _ in
                refreshStatusBarAppearance()
            }
    }

    private func refreshStatusBarAppearance() {
        guard
            let scene = UIApplication.shared.connectedScenes
                .compactMap({ $0 as? UIWindowScene })
                .first(where: { $0.activationState == .foregroundActive }),
            let window = scene.windows.first(where: \.isKeyWindow)
                ?? scene.windows.first
        else { return }

        // `preferredColorScheme(nil)` leaves the previous window style behind.
        if scheme == nil {
            window.overrideUserInterfaceStyle = .unspecified
        }

        var controller = window.rootViewController
        while let presented = controller?.presentedViewController {
            controller = presented
        }
        controller?.setNeedsStatusBarAppearanceUpdate()
    }
}
