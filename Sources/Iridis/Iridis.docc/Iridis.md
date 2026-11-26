# ``Iridis``

Named themes and semantic palettes for SwiftUI.

## Overview

Iridis separates the colors an interface uses into two pieces: an
``IridisPalette`` describes the semantic roles of one appearance, and an
``IridisTheme`` pairs a light and a dark palette under a name. The ``Iridis``
protocol describes the manager that holds the active theme and resolves the
palette for the effective color scheme; ``IridisImpl`` is its observable
default implementation.

The package is deliberately free of brand colors. An app defines the themes it
ships, registers them at launch and declares the `EnvironmentValues` entry that
exposes the manager to its views. This keeps the package reusable and keeps
user-facing theme names, persistence and onboarding in the app.

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
