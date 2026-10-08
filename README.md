# 🛠️ .dotfiles

This repository contains configuration files (dotfiles) to set up your development environment consistently across machines.

> **📌 Important:**
> Clone this repository into your `$HOME` directory as `~/dotfiles` and use symbolic links to activate each config.

---

## 🔗 How to Link

```bash
ln -s <source> <target>
# Example:
ln -s ~/dotfiles/.zshrc ~/.zshrc
```

You can automate the entire setup using the `setup-machine` script from a companion [scripts](https://github.com/armedev/scripts) repo.

---

## 📦 Components

### 🧠 Neovim (`nvim`)

* Kickstarted from [kickstart.nvim](https://github.com/nvim-lua/kickstart.nvim)
* Located in: `dotfiles/nvim`

**Steps:**

```bash
ln -s ~/dotfiles/nvim ~/.config/nvim
```

---

### 🔀 Hyprland (`hypr`)

* A Wayland compositor, commonly used on Arch Linux btw
* Located in: `dotfiles/hypr`

**Steps:**

```bash
ln -s ~/dotfiles/hypr ~/.config/hypr
```

---

### 📿 Tmux (`tmux`)

* Terminal multiplexer with custom config and [TPM](https://github.com/tmux-plugins/tpm) plugin manager
* Located in: `dotfiles/tmux`

**Steps:**

```bash
# Ensure tmux is installed
ln -s ~/dotfiles/tmux ~/.config/tmux
```

---

### 💻 WezTerm (wezterm)

* GPU-accelerated terminal emulator written in Rust
* Located in: `dotfiles/wezterm`

**Steps:**

```bash
# Ensure wezterm is installed
ln -s ~/dotfiles/wezterm ~/.config/wezterm
```

---

### 👚 Zsh

* Z shell setup using `oh-my-zsh` and custom dotfiles.

zsh reads its startup files in a fixed order, and each one is meant for a
different situation. Keeping configuration in the right file is what stops
things like `PATH` from going missing inside `tmux`:

| File         | Runs when                          | Holds                                                    |
| ------------ | ---------------------------------- | -------------------------------------------------------- |
| `.zshenv`    | **every** zsh (scripts, tmux, etc.)| PATH setup; sources `.zexports` and `.zlocal`             |
| `.zexports`  | via `.zshenv` (every shell)        | PATH entries, `BUN_INSTALL`, `NVM_DIR`                    |
| `.zprofile`  | **login** shells                   | brew/nvm/bun/gcloud/orbstack/dart init, tmux + ssh-agent  |
| `.zshrc`     | **interactive** shells             | oh-my-zsh, theme, plugins, aliases                        |
| `.zau`       | via `.zprofile` (login)            | auto-attach tmux (ssh-agent left to macOS launchd)        |

> `PATH` is made duplicate-free with `typeset -U path PATH`, so nested shells
> and tmux panes can't stack the same directory repeatedly. User overrides
> (e.g. `postgresql@16`) are re-applied after Homebrew so they keep priority.

**Steps:**

```bash
ln -s ~/dotfiles/.zshenv ~/.zshenv
ln -s ~/dotfiles/.zexports ~/.zexports
ln -s ~/dotfiles/.zprofile ~/.zprofile
ln -s ~/dotfiles/.zshrc ~/.zshrc
ln -s ~/dotfiles/.zau ~/.zau
```

---

## ⚙️ Automated Setup (Optional)

You can automate the linking process using a setup script:

```bash
git clone https://github.com/armedev/scripts ~/scripts
bash ~/scripts/setup-machine
```

The script supports flags like `--dry-run`, `--force`, and `--with-hypr`.

---

## 📜 License

MIT License. Use freely, modify responsibly. Contributions welcome.

---

## 🙌 Contributing

Feel free to fork and PR improvements or open issues if you have suggestions or bugs to report.
