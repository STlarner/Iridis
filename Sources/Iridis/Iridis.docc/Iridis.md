# ``Iridis``

Named themes and semantic palettes for SwiftUI.

## Overview

Iridis separates the colors an interface uses into two pieces: a
``Palette`` describes the semantic roles of one appearance, and a ``Theme``
pairs a light and a dark palette under a name. A ``ThemeManager`` holds the
active theme and resolves the palette for the effective color scheme.

The package is deliberately free of brand colors. An app defines the themes it
ships, registers them at launch and declares the `EnvironmentValues` entry that
exposes the manager to its views. This keeps the package reusable and keeps
user-facing theme names, persistence and onboarding in the app.

Color roles are semantic (`brandPrimary`, `surfacePrimary`, `textSecondary`)
rather than literal, so a screen keeps working when the theme changes. Values
are hexadecimal strings; bridge them to SwiftUI with `ColorHex.color` or to
UIKit with `ColorHex.uiColor`.

The manager is observable: changing the theme or the forced color scheme
updates every view that reads the manager from the environment.

## Topics

### Themes and palettes

- ``Theme``
- ``Palette``
- ``ColorHex``

### Managing the active theme

- ``ThemeManager``
- ``ThemeManagerImpl``

### Guides

- <doc:UsageGuide>
