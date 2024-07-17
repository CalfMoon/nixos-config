{ pkgs, ... }: {
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

  xdg.configFile."lf/icons".text = ''
    ln             # LINK
    or             # ORPHAN
    tw      t       # STICKY_OTHER_WRITABLE
    ow             # OTHER_WRITABLE
    st      t       # STICKY
    di            # DIR
    pi      p       # FIFO
    so      s       # SOCK
    bd      b       # BLK
    cd      c       # CHR
    su      u       # SETUID
    sg      g       # SETGID
    ex             # EXEC
    fi            # FILE

    # file extensions (vim-devicons)
    *.styl          
    *.sass          
    *.scss          
    *.htm           
    *.html          
    *.slim          
    *.haml          
    *.ejs           
    *.css           
    *.less          
    *.md            
    *.mdx           
    *.markdown      
    *.rmd           
    *.json          
    *.webmanifest   
    *.js            
    *.mjs           
    *.jsx           
    *.rb            
    *.gemspec       
    *.rake          
    *.php           
    *.py            
    *.pyc           
    *.pyo           
    *.pyd           
    *.coffee        
    *.mustache      
    *.hbs           
    *.conf          
    *.ini           
    *.yml           
    *.yaml          
    *.toml          
    *.bat           
    *.mk            
    *.jpg           
    *.jpeg          
    *.bmp           
    *.png           
    *.webp          
    *.gif           
    *.ico           
    *.twig          
    *.cpp           
    *.c++           
    *.cxx           
    *.cc            
    *.cp            
    *.c             
    *.cs            󰌛
    *.h             
    *.hh            
    *.hpp           
    *.hxx           
    *.hs            
    *.lhs           
    *.nix           
    *.lua           
    *.java          
    *.sh            
    *.fish          
    *.bash          
    *.zsh           
    *.ksh           
    *.csh           
    *.awk           
    *.ps1           
    *.ml            λ
    *.mli           λ
    *.diff          
    *.db            
    *.sql           
    *.dump          
    *.clj           
    *.cljc          
    *.cljs          
    *.edn           
    *.scala         
    *.go            
    *.dart          
    *.xul           
    *.sln           󰘐
    *.suo           󰘐
    *.pl            
    *.pm            
    *.t             
    *.rss           
    '*.f#'          
    *.fsscript      
    *.fsx           
    *.fs            
    *.fsi           
    *.rs            
    *.rlib          
    *.d             
    *.erl           
    *.hrl           
    *.ex            
    *.exs           
    *.eex           
    *.leex          
    *.heex          
    *.vim           
    *.ai            
    *.psd           
    *.psb           
    *.ts            
    *.tsx           
    *.jl            
    *.pp            
    *.vue           
    *.elm           
    *.swift         
    *.xcplayground  
    *.tex           󰙩
    *.r             󰟔
    *.rproj         󰗆
    *.sol           󰡪
    *.pem          󰌋

    # file names (vim-devicons) (case-insensitive not supported in lf)
    *gruntfile.coffee       
    *gruntfile.js           
    *gruntfile.ls           
    *gulpfile.coffee        
    *gulpfile.js            
    *gulpfile.ls            
    *mix.lock               
    *dropbox                󰇣
    *.ds_store              
    *.gitconfig             
    *.gitignore             
    *.gitattributes         
    *.gitlab-ci.yml         
    *.bashrc                
    *.zshrc                 
    *.zshenv                
    *.zprofile              
    *.vimrc                 
    *.gvimrc                
    *_vimrc                 
    *_gvimrc                
    *.bashprofile           
    *favicon.ico            
    *license                
    *node_modules           󰎙
    *react.jsx              
    *procfile               
    *dockerfile             
    *docker-compose.yml     
    *docker-compose.yaml    
    *compose.yml            
    *compose.yaml           
    *rakefile               
    *config.ru              
    *gemfile                
    *makefile               
    *cmakelists.txt         
    *robots.txt             󰚩

    # file names (case-sensitive adaptations)
    *Gruntfile.coffee       
    *Gruntfile.js           
    *Gruntfile.ls           
    *Gulpfile.coffee        
    *Gulpfile.js            
    *Gulpfile.ls            
    *Dropbox                󰇣
    *.DS_Store              
    *LICENSE                
    *React.jsx              
    *Procfile               
    *Dockerfile             
    *Docker-compose.yml     
    *Docker-compose.yaml    
    *Rakefile               
    *Gemfile                
    *Makefile               
    *CMakeLists.txt         

    # file patterns (file name adaptations)
    *jquery.min.js          
    *angular.min.js         
    *backbone.min.js        
    *require.min.js         
    *materialize.min.js     
    *materialize.min.css    
    *mootools.min.js        
    *vimrc                  
    Vagrantfile             

    # archives or compressed (extensions from dircolors defaults)
    *.tar   󰞹
    *.tgz   󰞹
    *.arc   󰞹
    *.arj   󰞹
    *.taz   󰞹
    *.lha   󰞹
    *.lz4   󰞹
    *.lzh   󰞹
    *.lzma  󰞹
    *.tlz   󰞹
    *.txz   󰞹
    *.tzo   󰞹
    *.t7z   󰞹
    *.zip   󰞹
    *.z     󰞹
    *.dz    󰞹
    *.gz    󰞹
    *.lrz   󰞹
    *.lz    󰞹
    *.lzo   󰞹
    *.xz    󰞹
    *.zst   󰞹
    *.tzst  󰞹
    *.bz2   󰞹
    *.bz    󰞹
    *.tbz   󰞹
    *.tbz2  󰞹
    *.tz    󰞹
    *.deb   󰞹
    *.rpm   󰞹
    *.jar   󰞹
    *.war   󰞹
    *.ear   󰞹
    *.sar   󰞹
    *.rar   󰞹
    *.alz   󰞹
    *.ace   󰞹
    *.zoo   󰞹
    *.cpio  󰞹
    *.7z    󰞹
    *.rz    󰞹
    *.cab   󰞹
    *.wim   󰞹
    *.swm   󰞹
    *.dwm   󰞹
    *.esd   󰞹

    # image formats (extensions from dircolors defaults)
    *.jpg   
    *.jpeg  
    *.mjpg  
    *.mjpeg 
    *.gif   
    *.bmp   
    *.pbm   
    *.pgm   
    *.ppm   
    *.tga   
    *.xbm   
    *.xpm   
    *.tif   
    *.tiff  
    *.png   
    *.svg   
    *.svgz  
    *.mng   
    *.pcx   
    *.mov   
    *.mpg   
    *.mpeg  
    *.m2v   
    *.mkv   
    *.webm  
    *.ogm   
    *.mp4   
    *.m4v   
    *.mp4v  
    *.vob   
    *.qt    
    *.nuv   
    *.wmv   
    *.asf   
    *.rm    
    *.rmvb  
    *.flc   
    *.avi   
    *.fli   
    *.flv   
    *.gl    
    *.dl    
    *.xcf   
    *.xwd   
    *.yuv   
    *.cgm   
    *.emf   
    *.ogv   
    *.ogx   

    # audio formats (extensions from dircolors defaults)
    *.aac   
    *.au    
    *.flac  
    *.m4a   
    *.mid   
    *.midi  
    *.mka   
    *.mp3   
    *.mpc   
    *.ogg   
    *.ra    
    *.wav   
    *.oga   
    *.opus  
    *.spx   
    *.xspf  

    # other formats
    *.pdf   
  '';

}
