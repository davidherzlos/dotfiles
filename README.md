To place the dotfiles for a particular application using gnu stow:

```bash
cd ~/this/repo/
stow -t ~/ appdir/ # kitty, nvim, etc
```

Use -nv to simulate stow to preview changes:

```bash
stow -nv -t ~/ appdir/
```
