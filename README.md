# Amin Vakil's AUR packages

[![Nightly CI](https://github.com/aminvakil/aur/actions/workflows/schedule.yml/badge.svg)](https://github.com/aminvakil/aur/actions/workflows/schedule.yml)

This repository contains Arch Linux package recipes maintained by
[Amin Vakil](https://aur.archlinux.org/account/aminvakil) for the
[Arch User Repository](https://aur.archlinux.org/).

Each package lives in its own directory and usually contains a `PKGBUILD`, a
matching `.SRCINFO`, and any extra files needed by that package, such as patches,
systemd units, install scripts, desktop files, or helper scripts.

## Building a package

Clone the package from the AUR and build it with `makepkg`:

```sh
git clone https://aur.archlinux.org/<package>.git
cd <package>
makepkg -s
```

As with any AUR package, review the `PKGBUILD` before building it.

## Repository layout

```text
.
├── <package>/
│   ├── PKGBUILD
│   ├── .SRCINFO
│   └── package-specific files
└── .github/workflows/
    ├── ci.yml
    └── schedule.yml
```

## Updating or contributing

Pull requests and issues are welcome for broken builds, outdated packages, and
packaging improvements.

For package changes, please keep `PKGBUILD` and `.SRCINFO` in sync:

```sh
cd <package>
updpkgsums        # when source checksums changed
makepkg --printsrcinfo > .SRCINFO
makepkg -s
```

## Automation

- Pull requests and pushes run CI for packages with changed `PKGBUILD` files.
- CI builds packages in an Arch Linux container and runs packaging checks with
  `namcap` and `alpm-lint`.
- Pushes to `master` publish changed packages to the AUR with `aurpublish`.
- A nightly workflow builds a selected matrix of packages to catch breakage from
  upstream changes or Arch package updates.

## License

The packaging files and repository scripts are licensed under the
[GNU General Public License v3.0](LICENSE). Upstream projects packaged here have
their own licenses.
