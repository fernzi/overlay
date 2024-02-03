# Fern’s Gentoo Overlay

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
