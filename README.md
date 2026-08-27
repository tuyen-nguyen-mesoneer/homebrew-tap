# mesoneer Homebrew tap

Homebrew casks for [mesoneer AG](https://www.mesoneer.io/?r=0) macOS tools.

## Install

```sh
brew tap tuyen-nguyen-mesoneer/tap
brew install --cask m_capture
```

The tap only has to be added once; after that the bare cask name is enough.

Or in a `brew bundle` `Brewfile`:

```ruby
tap "tuyen-nguyen-mesoneer/tap"
cask "m_capture"
```

## Casks

| Cask | Description |
| --- | --- |
| [`m_capture`](Casks/m_capture.rb) | Menu-bar tool for screenshots and screen recording — [repository](https://github.com/tuyen-nguyen-mesoneer/m_capture) |

`m_capture` installs into `~/Applications` and keeps itself up to date from GitHub
Releases, so `brew upgrade` leaves it alone (`auto_updates true`).
