{ ... }: {
  xdg.mimeApps.enable = true;
  xdg.mimeApps.defaultApplications = {
    "inode/directory" = [ "lf.desktop" ];
    "text/plain" = [ "nvim.desktop" ];
    "text/markdown" = [ "nvim.desktop" ];

    "text/javascript" = [ "nvim.desktop" ];
    "text/css" = [ "nvim.desktop" ];
    "text/html" = [ "nvim.desktop" ];
    "application/json" = [ "nvim.desktop" ];

    "text/x-python" = [ "nvim.desktop" ];
    "application/toml" = [ "nvim.desktop" ];

    "text/rust" = [ "nvim.desktop" ];

    "image/jpeg" = [ "qimgv.desktop" ];
    "image/jpg" = [ "qimgv.desktop" ];
    "image/png" = [ "qimgv.desktop" ];

    "video/x-matroska" = [ "mpv.desktop" ];

    "application/pdf" = [ "org.pwmt.zathura-pdf-mupdf.desktop" ];
  };
}
