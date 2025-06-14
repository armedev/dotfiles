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

* Z shell setup using `oh-my-zsh` and custom dotfiles
* Files:

  * `.zshrc`
  * `.zprofile`
  * `.zshenv`
  * `.zexports`

**Steps:**

```bash
ln -s ~/dotfiles/.zshrc ~/.zshrc
ln -s ~/dotfiles/.zprofile ~/.zprofile
ln -s ~/dotfiles/.zshenv ~/.zshenv
ln -s ~/dotfiles/.zexports ~/.zexports
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
