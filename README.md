# homebrew-klin

Homebrew tap for the [Klin](https://github.com/MrHIDEn/klin) compiler.

## Install

```sh
brew tap dart-lang/dart   # build dependency
brew tap mrhiden/klin
brew install klin
klin --version
```

Latest `main` (unreleased):

```sh
brew install --HEAD klin
```

Upgrade:

```sh
brew upgrade klin
```

## Notes

- Klin needs a host C compiler (`gcc`, `clang`, or `tcc`) for `klin run`.
- Stable installs build from the GitHub source tag (see `Formula/klin.rb`).
- Binaries are also published on [Klin releases](https://github.com/MrHIDEn/klin/releases).
