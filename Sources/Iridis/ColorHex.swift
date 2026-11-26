/// A color expressed as a hexadecimal string, for example `"#E07A60"`.
///
/// Iridis stores palettes as plain strings so a theme is inspectable data that
/// can live in a repository, a JSON file or a design specification. Bridge a
/// value to SwiftUI with ``color`` or to UIKit with ``uiColor``.
public typealias ColorHex = String
