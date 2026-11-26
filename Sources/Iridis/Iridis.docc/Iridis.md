# ``Iridis``

Theme and palette management for SwiftUI.

## Overview

An ``IridisTheme`` pairs a light and a dark ``IridisPalette``. The ``Iridis``
protocol is the manager contract; ``IridisImpl`` is the default observable
implementation. The package ships no brand colors and no persistence: the app
defines its themes, registers them at launch and declares the
`EnvironmentValues` entry that exposes the manager.

Public types carry the package name (`IridisTheme`, `IridisPalette`,
`IridisColorHex`) so an app can keep its own `Theme`, `Palette` or theme
manager without an ambiguity.

Color roles are semantic (`brandPrimary`, `surfacePrimary`, `textSecondary`)
rather than literal, so a screen keeps working when the theme changes. Values
are hexadecimal strings; bridge them to SwiftUI with `IridisColorHex.color` or
to UIKit with `IridisColorHex.uiColor`.

The manager is observable: changing the theme or the forced color scheme
updates every view that reads the manager from the environment.

## Topics

### Themes and palettes

- ``IridisTheme``
- ``IridisPalette``
- ``IridisColorHex``

### Managing the active theme

- ``Iridis``
- ``IridisImpl``

### Guides

- <doc:UsageGuide>
