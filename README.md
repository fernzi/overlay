# Fern’s Gentoo Overlay

[![License](https://img.shields.io/github/license/fernzi/overlay?label=License)](LICENSE)
[![PKGCheck](https://github.com/fernzi/overlay/actions/workflows/pkgcheck.yml/badge.svg)][gh-act]

Heyo! You’ve found my repository (or overlay) for Gentoo! 
It includes mostly personal stuff and some other things 
missing from the official repos, maybe.

## Installation

You can add my repo to using `eselect-repository` as usual:

```sh
# Install eselect-repo and Git if you haven't yet.
emerge -a app-eselect/eselect-repository dev-vcs/git

# And then add the best repo ever
eselect repository add fernzi git https://github.com/fernzi/overlay.git
emaint sync -r fernzi
```

[gh-act]: https://github.com/fernzi/overlay/actions/workflows/pkgcheck.yml
