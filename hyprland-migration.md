1. We will be installing wayland(hyprland wm instead of sway), along side x11.
  - That is why first, we need to enable the `tty`, i.e when user is logged in,
    he should see the tty so that he can either start `x11(via startx)`, or the wayland server(hyprland).
  -  disable any display server you might be having and run # `systemctl set-default multi-user.target`

2. after that, we should put the .xinitrc in the home so that x11 could use it. use the one if have committed.
  - If you see, in the end `bspwm` is getting started using xinitrc. So you should have it installed.

3. After that, install hyprland using their official documentation.
  - For `Nvidia` cards, we will need to perform some extra steps. Refer original documentation.
  - `xdg-portal` related stuff will need to be taken care of as well.

4. use the hypr and waybar conf I have committed.

