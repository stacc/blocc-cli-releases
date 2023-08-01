# Blocc CLI

This repository is being used to hold the Blocc CLI [releases](https://github.com/stacc/blocc-cli/releases).

## Installation

* [Homebrew](#using-homebrew-macos--linux)
* [Scoop](#using-scoop-windows)
* [From terminal](#from-terminal)
* [Direct download](#direct-download)

### Using homebrew (MacOS / Linux)

First add the repository with

```
brew tap stacc/tap
```

Then install the CLI with

```
brew install blocc
```

### Using scoop (Windows)

First add the repository with

```
scoop bucket add stacc https://github.com/stacc/blocc-cli
```

Then install the CLI with

```
scoop install stacc
```

### From terminal

MacOS and Linux users

```
curl -s https://raw.githubusercontent.com/stacc/blocc-cli/main/install.sh | bash -s --
```

Windows users

```
curl -LSs https://raw.githubusercontent.com/stacc/blocc-cli/main/install.bat -o %TEMP%\blocc-install.bat && CMD /C %TEMP%\blocc-install.bat && del %TEMP%\blocc-install.bat
```

### Direct download

Download the latest release [here](https://github.com/stacc/blocc-cli/releases/latest).
