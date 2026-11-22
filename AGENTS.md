# AUR packaging

- Follow the relevant Arch packaging guidelines and existing similar PKGBUILDs
  here. Consult official Arch packages when unsure.
- Keep PKGBUILDs minimal. Prefer standard build commands over custom hacks;
  avoid unnecessary flags, variables, dependencies, comments, and formatting changes.
- Do not create or modify `.SRCINFO`; the maintainer handles it.
- Do not run `makepkg`; the maintainer builds and provides logs.
- Never edit on `master`; use a task branch. Do not stage, commit, or push
  unless explicitly requested.
- Reviews and suggestions are read-only until approved. Apply agreed changes
  one at a time.
- Prefer upstream files and CI logs via `gh` over cloning large repositories.
