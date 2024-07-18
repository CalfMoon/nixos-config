{ ... }:
{
  xdg.mimeApps.enable = true;
  xdg.mimeApps.defaultApplications = {
    "text/plain" = [ "nvim.desktop" ];
    "text/markdown" = [ "nvim.desktop" ];

    "text/javascript" = [ "nvim.desktop" ];
    "text/css" = [ "nvim.desktop" ];
    "text/html" = [ "nvim.desktop" ];
    "application/json" = [ "nvim.desktop" ];

    "text/x-python" = [ "nvim.desktop" ];
    "application/toml" = [ "nvim.desktop" ];

    "text/rust" = [ "nvim.desktop" ];

    "image/jpeg" = [ "org.gnome.Loupe.desktop" ];
    "image/jpg" = [ "org.gnome.Loupe.desktop" ];
    "image/png" = [ "org.gnome.Loupe.desktop" ];

    "application/pdf" = [ "org.pwmt.zathura-pdf-mupdf.desktop" ];
  };
}
