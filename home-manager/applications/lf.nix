{ pkgs, ... }:
{
  xdg.configFile."lf/icons".source = ./icons;

  programs.lf = {
    enable = true;

    commands = {
      open = ''$xdg-open "$f"'';
      open_editor = ''$$EDITOR .'';

      mkdir = ''
            ''${{
        printf "Directory Name: "
        read ans
        mkdir "$ans"
            }}'';

      mkfile = ''
            ''${{
        printf "File Name: "
        read ans
        touch "$ans"
            }}'';


      unarchive = ''
        ''${{
          case "$f" in
              *.zip) ${pkgs.unzip}/bin/unzip "$f" ;;
              *.tar.gz) ${pkgs.gnutar}/bin/tar -xzvf "$f" ;;
              *.tar.bz2) ${pkgs.gnutar}/bin/tar -xjvf "$f" ;;
              *.tar) ${pkgs.gnutar}/bin/tar -xvf "$f" ;;
              *) echo "Unsupported format" ;;
          esac
        }}'';

      archive = ''
        ''${{
        set -f
        mkdir $1
        cp -r $fx $1
        ${pkgs.zip}/bin/zip -r $1.zip $1
        rm -rf $1
        }}'';

      trash = ''
        ''${{
          files=$(printf "$fx" | tr '\n' ';')
          while [ "$files" ]; do
            file=''${files%%;*}

            ${pkgs.trash-cli}/bin/trash-put "$(basename "$file")"
            if [ "$files" = "$file" ]; then
              files=""
        else
        files="''${files#*;}"
        fi
        done
        }}'';

      restore_trash = ''
              ''${{
          ${pkgs.trash-cli}/bin/trash-restore
        }}'';
    };

    keybindings = {
      m = "";
      mf = "mkfile";
      md = "mkdir";

      a = "";
      au = "unarchive";
      ar = "archive";

      o = "";
      oe = "open_editor";

      d = "";
      dd = "trash";
      dr = "restore_trash";

      "." = "set hidden!";
      p = "paste";
      x = "cut";
      y = "copy";
      r = "reload";
      R = "rename";
      c = "clear";
      "<enter>" = "open";

      g = "";
      gD = "cd ~/Documents";
      gd = "cd ~/Downloads";
      gm = "cd ~/Music";
      gp = "cd ~/Pictures";
      gc = "cd ~/.config";
      gt = "cd ~/.local/share/Trash/files";
    };

    settings = {
      hidden = true;
      ignorecase = true;
      preview = true;

      icons = true;

      previewer = "${pkgs.ctpv}/bin/ctpv";
      cleaner = "${pkgs.ctpv}/bin/ctpvclear";
    };

    extraConfig = ''
      &ctpv -s $id
      &ctpvquit $id
    '';
  };
}
