# Dot files

Rofi requires [rofi-themes](git@github.com:DaveDavenport/rofi-themes.git) to be cloned to `vcs/` dir.

# Packages to install

    FONTS="ttf-ms-fonts ttf-roboto ttf-dejavu otf-fira-code otf-font-awesome siji-git ttf-droid ttf-fira-code ttf-inconsolata ttf-liberation"
    PKGS="xautolock compton dunst polybar-git kitty xorg-xrandr oh-my-zsh-git exa feh lightdm"
    yaourt -S $FONTS $PKGS

# Install dotfiles

    ln -sf `pwd`/i3 ~/.config/
    ln -sf `pwd`/polybar ~/.config/
    ln -sf `pwd`/compton ~/.config/
    ln -sf `pwd`/dunst ~/.config/
    ln -sf `pwd`/gtk-3.0 ~/.config/
    ln -sf `pwd`/kitty ~/.config/
    ln -sf `pwd`/rofi ~/.config/
