{ config, ... }: {
  home.sessionVariables = {
    ## Applications
    BROWSER = "brave";
    FONT = "JetBrains Mono";
    TERMINAL = "kitty";
    TERM = "kitty";
    EDITOR = "nvim";

    ## Extra Paths
    PATH = "$PATH:$HOME/.local/bin/:$HOME/.local/share/scripts/:$HOME/.local/share/cargo/bin/:$HOME/.config/rofi/bin/";

    XDG_CONFIG_HOME = "$HOME/.config";
    XDG_DATA_HOME = "$HOME/.local/share";
    XDG_STATE_HOME = "$HOME/.local/state";
    XDG_CACHE_HOME = "$HOME/.cache";

    # Clean home directory
    __GL_SHADER_DISK_CACHE_PATH = "${config.home.sessionVariables.XDG_CACHE_HOME}/nvidia";
    CUDA_CACHE_PATH = "${config.home.sessionVariables.XDG_CACHE_HOME}/nv";
    ICEAUTHORITY = "${config.home.sessionVariables.XDG_CACHE_HOME}/ICEauthority";
    NUGET_PACKAGES = "${config.home.sessionVariables.XDG_CACHE_HOME}/NuGetPackages";
    XCOMPOSECACHE = "${config.home.sessionVariables.XDG_CACHE_HOME}/X11/xcompose";

    ELECTRUMDIR = "${config.home.sessionVariables.XDG_DATA_HOME}/electrum";
    GNUPGHOME = "${config.home.sessionVariables.XDG_DATA_HOME}/gnupg";
    JULIA_DEPOT_PATH = "${config.home.sessionVariables.XDG_DATA_HOME}/julia:$JULIA_DEPOT_PATH";
    NODE_REPL_HISTORY = "${config.home.sessionVariables.XDG_DATA_HOME}/node_repl_history";
    TERMINFO = "${config.home.sessionVariables.XDG_DATA_HOME}/terminfo";
    TERMINFO_DIRS = "${config.home.sessionVariables.XDG_DATA_HOME}/terminfo:/usr/share/terminfo";
    WINEPREFIX = "${config.home.sessionVariables.XDG_DATA_HOME}/wine";
    PASSWORD_STORE_DIR = "${config.home.sessionVariables.XDG_DATA_HOME}/password-store";
    GOPATH = "${config.home.sessionVariables.XDG_DATA_HOME}/go";
    CARGO_HOME = "${config.home.sessionVariables.XDG_DATA_HOME}/cargo";
    JAVA_HOME = "${config.home.sessionVariables.XDG_DATA_HOME}/java";
    RUSTUP_HOME = "${config.home.sessionVariables.XDG_DATA_HOME}/rustup";

    NOTMUCH_CONFIG = "${config.home.sessionVariables.XDG_CONFIG_HOME}/notmuch-config";
    _JAVA_OPTIONS = "-Djava.util.prefs.userRoot=${config.home.sessionVariables.XDG_CONFIG_HOME}/java";
    PARALLEL_HOME = "${config.home.sessionVariables.XDG_CONFIG_HOME}/parallel";
    WGETRC = "${config.home.sessionVariables.XDG_CONFIG_HOME}/wget/wgetrc";
    MBSYNCRC = "${config.home.sessionVariables.XDG_CONFIG_HOME}/mbsync/config";
    NPM_CONFIG_USERCONFIG = "${config.home.sessionVariables.XDG_CONFIG_HOME}/npm/npmrc";
    ANDROID_SDK_HOME = "${config.home.sessionVariables.XDG_CONFIG_HOME}";
    XCOMPOSEFILE = "${config.home.sessionVariables.XDG_CONFIG_HOME}/X11/xcompose";
    LESSHISTFILE = "-";

    PYTHON_HISTORY = "${config.home.sessionVariables.XDG_STATE_HOME}/python/history";

    N_PREFIX = "$HOME/.local/bin/n";

    LC_ALL = "en_US.UTF-8";

    QT_STYLE_OVERRIDE = "kvantum";
  };
}
