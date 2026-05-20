# Themes and Customization

> **Note:** Antigravity 2.0 is Google's codename for the next-generation agentic
> development platform. The current public-facing implementation is distributed as
> **Gemini CLI** (`@google/gemini-cli`). This note tracks the authoritative public
> information available as of **2026-05-20**.

## Overview

Gemini CLI provides built-in theme support with both dark and light color schemes,
as well as the ability to define custom color themes. Themes can be changed
interactively via the `/theme` command or set persistently in `settings.json`.

Source: [Themes documentation](https://google-gemini.github.io/gemini-cli/docs/cli/themes.html)

## Built-in Themes

### Dark Themes

| Theme | Description |
|---|---|
| `ANSI` | Default ANSI color palette |
| `Atom One Dark` | Atom editor's dark theme |
| `Ayu` | Ayu dark theme |
| `Default` | Default Gemini CLI dark theme |
| `Dracula` | Dracula dark theme |
| `GitHub` | GitHub dark theme |

### Light Themes

| Theme | Description |
|---|---|
| `ANSI Light` | ANSI palette for light backgrounds |
| `Ayu Light` | Ayu light theme |
| `Default Light` | Default Gemini CLI light theme |
| `GitHub Light` | GitHub light theme |
| `Google Code` | Google Code syntax highlighting colors |
| `Xcode` | Xcode default light theme |

## Changing Themes

1. Enter `/theme` into Gemini CLI.
2. A dialog lists all available themes (built-in + custom).
3. Use arrow keys to select a theme.
4. Confirm selection to apply.

**Note:** If a theme is defined in `settings.json`, remove the `"theme"` setting
before using `/theme` to switch themes interactively.

## Theme Persistence

Selected themes are saved to Gemini CLI's [configuration](https://google-gemini.github.io/gemini-cli/docs/get-started/configuration.html)
so the preference persists across sessions.

## Custom Color Themes

Users can define custom themes in `settings.json` with full control over the color
palette. Custom themes are specified under the `themes` key:

```json
{
  "themes": {
    "MyCustomTheme": {
      "colors": {
        "Foreground": "#FFFFFF",
        "Background": "#282A2E",
        "Cursor": "#F1FA8C",
        "AccentRed": "#FF5555",
        "AccentGreen": "#50FA7B",
        "AccentYellow": "#F1FA8C",
        "Comment": "#6272A4",
        "Gray": "#ABB2BF"
      }
    }
  }
}
```

Themes may also include `GradientColors` as an array of hex values.

### Using Custom Themes

- Select via the `/theme` command (custom themes appear in the dialog).
- Set as default by adding `"theme": "MyCustomTheme"` to the `ui` object in
  `settings.json`.
- Custom themes can be set at user, project, or system level following the
  standard [configuration precedence](https://google-gemini.github.io/gemini-cli/docs/get-started/configuration.html).

### Loading Themes from a File

Themes can also be loaded from external `.json` theme files. The file path is
specified in the `ui.theme` setting.

**Security:** Theme files must be located within the user's home directory.
Loading themes from outside the home directory triggers a warning and the theme
is not loaded.

## Sources

- [Themes documentation](https://google-gemini.github.io/gemini-cli/docs/cli/themes.html)
