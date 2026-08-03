# homebrew-klin

Homebrew tap for the [Klin](https://github.com/klin-lang/klin) compiler.

## Install

Short form (auto-taps this repo):

```sh
brew tap dart-lang/dart
brew install klin-lang/klin/klin
klin --version
```

Explicit:

```sh
brew tap dart-lang/dart
brew tap klin-lang/klin
brew install klin
```

HEAD (`main`):

```sh
brew install --HEAD klin-lang/klin/klin
```

Upgrade:

```sh
brew upgrade klin
```

## Notes

- Klin needs a host C compiler (`gcc`, `clang`, or `tcc`) for `klin run`.
- Stable installs build from the GitHub source tag (see `Formula/klin.rb`).
- Binaries: [Klin releases](https://github.com/klin-lang/klin/releases).
