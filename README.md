# wbreiler's Homebrew tap

Personal Homebrew casks and formulae maintained by [wbreiler](https://github.com/wbreiler).
This is a third-party tap, separate from Homebrew's official repositories.

## Add the tap

```sh
brew tap wbreiler/taps https://github.com/wbreiler/taps
```

The explicit URL is needed because this repository is named `taps`, without
Homebrew's conventional `homebrew-` prefix. Add the tap once before installing
packages from it.

## Install Mineways

This cask packages [wbreiler's native macOS fork of Mineways](https://github.com/wbreiler/Mineways).
Requires an Apple Silicon Mac with macOS 15 Sequoia or later.
The `wbreiler-mineways` token distinguishes the fork from upstream Mineways.

```sh
brew install --cask wbreiler/taps/wbreiler-mineways
```

Homebrew installs `Mineways.app` in `/Applications`. If Mineways is already
installed there manually, move that copy elsewhere before installing the cask.
The release includes its libraries, so users do not need to install wxWidgets.

The app is ad-hoc signed and is not notarized. Homebrew retains quarantine,
so macOS can block first launch. Review the release's
[first-launch instructions](https://github.com/wbreiler/Mineways/releases/latest)
before using it. The cask does not change Gatekeeper settings or remove quarantine.
Official Homebrew inclusion requires a release that passes its
[Gatekeeper checks](https://docs.brew.sh/Acceptable-Casks#platform-compatibility-and-macos-security-protections).

## Update or remove Mineways

To update:

```sh
brew update
brew upgrade --cask wbreiler/taps/wbreiler-mineways
```

To remove:

```sh
brew uninstall --cask wbreiler/taps/wbreiler-mineways
```

Uninstall removes the app. It preserves preferences, worlds, and exported models.

## Maintain Mineways

After a new macOS release publishes successfully:

1. Confirm its tag and app version match the integrated Windows/upstream version.
2. Update `version` and `sha256` in `Casks/wbreiler-mineways.rb` from the published ZIP.
3. Check its architecture and minimum macOS version before changing `depends_on`.
4. Run the checks below in a local checkout of the installed tap.
5. Commit and push the cask update when publication is authorized.

```sh
brew style Casks/wbreiler-mineways.rb
brew audit --cask --strict --online wbreiler/taps/wbreiler-mineways
brew livecheck --cask wbreiler/taps/wbreiler-mineways
```

`livecheck` detects new releases. It does not update the cask automatically.
The online audit for a personal tap does not establish Gatekeeper acceptance.

## Add other software

Add GUI application casks under `Casks/` and formulae under `Formula/`.
Use distinct package names and document their installation commands here.
