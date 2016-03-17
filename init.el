;; -*- mode: emacs-lisp -*-
;; This file is loaded by Spacemacs at startup.
;; It must be stored in your home directory.
(load-file "~/.spacemacs.d/functions.el")
(require 'spacemacs-functions)

(defun dotspacemacs/layers ()
  "Configuration Layers declaration.
You should not put any user code in this function besides modifying the variable
values."
  (setq-default
   ;; Base distribution to use. This is a layer contained in the directory
   ;; `+distribution'. For now available distributions are `spacemacs-base'
   ;; or `spacemacs'. (default 'spacemacs)
   dotspacemacs-distribution 'spacemacs
   ;; List of additional paths where to look for configuration layers.
   ;; Paths must have a trailing slash (i.e. `~/.mycontribs/')
   dotspacemacs-configuration-layer-path '()
   ;; List of configuration layers to load. If it is the symbol `all' instead
   ;; of a list then all discovered layers will be installed.
   dotspacemacs-configuration-layers
   '(
     ;; ----------------------------------------------------------------
     ;; Example of useful layers you may want to use right away.
     ;; Uncomment some layer names and press <SPC f e R> (Vim style) or
     ;; <M-m f e R> (Emacs style) to install them.
     ;; ----------------------------------------------------------------
     python
     auto-completion
     better-defaults
     emacs-lisp
     git
     javascript
     react
     markdown
     floobits
     spotify
     go
     spacemacs-layouts
     ;; markdown
     ;; org
     (shell :variables
            shell-default-height 30
            shell-default-position 'bottom)
     spell-checking
     (syntax-checking :variables syntax-checking-enable-tooltips nil)
     version-control
     (osx :variables osx-use-option-as-meta nil)
     themes-megapack
     )
   ;; List of additional packages that will be installed without being
   ;; wrapped in a layer. If you need some configuration for these
   ;; packages then consider to create a layer, you can also put the
   ;; configuration in `dotspacemacs/config'.
   dotspacemacs-additional-packages
   '(
     scratch
     move-dup
     dockerfile-mode
     restclient
     gist
     zop-to-char
     shackle
     )
   ;; A list of packages and/or extensions that will not be install and loaded.
   dotspacemacs-excluded-packages
   '(
     tern
     evil-search-highlight-persist
     web-mode
     )
   ;; If non-nil spacemacs will delete any orphan packages, i.e. packages that
   ;; are declared in a layer which is not a member of
   ;; the list `dotspacemacs-configuration-layers'. (default t)
   dotspacemacs-delete-orphan-packages t))

(defun dotspacemacs/init ()
  "Initialization function.
This function is called at the very startup of Spacemacs initialization
before layers configuration.
You should not put any user code in there besides modifying the variable
values."
  ;; This setq-default sexp is an exhaustive list of all the supported
  ;; spacemacs settings.
  (setq-default
   ;; One of `vim', `emacs' or `hybrid'. Evil is always enabled but if the
   ;; variable is `emacs' then the `holy-mode' is enabled at startup. `hybrid'
   ;; uses emacs key bindings for vim's insert mode, but otherwise leaves evil
   ;; unchanged. (default 'vim)
   dotspacemacs-editing-style 'hybrid
   ;; If non nil output loading progress in `*Messages*' buffer. (default nil)
   dotspacemacs-verbose-loading nil
   ;; Specify the startup banner. Default value is `official', it displays
   ;; the official spacemacs logo. An integer value is the index of text
   ;; banner, `random' chooses a random text banner in `core/banners'
   ;; directory. A string value must be a path to an image format supported
   ;; by your Emacs build.
   ;; If the value is nil then no banner is displayed. (default 'official)
   dotspacemacs-startup-banner 'official
   ;; List of items to show in the startup buffer. If nil it is disabled.
   ;; Possible values are: `recents' `bookmarks' `projects'.
   ;; (default '(recents projects))
   dotspacemacs-startup-lists '(projects recents)
   ;; List of themes, the first of the list is loaded when spacemacs starts.
   ;; Press <SPC> T n to cycle to the next theme in the list (works great
   ;; with 2 themes variants, one dark and one light)
   dotspacemacs-themes '(
                         monokai
                         molokai-andy
                         spacemacs-dark
                         spacemacs-light
                         )
   ;; If non nil the cursor color matches the state color.
   dotspacemacs-colorize-cursor-according-to-state t
   ;; Default font. `powerline-scale' allows to quickly tweak the mode-line
   ;; size to make separators look not too crappy.
   dotspacemacs-default-font '("Inconsolatag"
                               :size 13
                               :weight normal
                               :width normal
                               :powerline-scale 1.1)
   ;; The leader key
   dotspacemacs-leader-key "SPC"
   ;; The leader key accessible in `emacs state' and `insert state'
   ;; (default "M-m")
   dotspacemacs-emacs-leader-key "M-m"
   ;; Major mode leader key is a shortcut key which is the equivalent of
   ;; pressing `<leader> m`. Set it to `nil` to disable it. (default ",")
   dotspacemacs-major-mode-leader-key ","
   ;; Major mode leader key accessible in `emacs state' and `insert state'.
   ;; (default "C-M-m)
   dotspacemacs-major-mode-emacs-leader-key "C-M-m"
   ;; The command key used for Evil commands (ex-commands) and
   ;; Emacs commands (M-x).
   ;; By default the command key is `:' so ex-commands are executed like in Vim
   ;; with `:' and Emacs commands are executed with `<leader> :'.
   dotspacemacs-command-key ":"
   ;; If non nil `Y' is remapped to `y$'. (default t)
   dotspacemacs-remap-Y-to-y$ t
   ;; Name of the default layout (default "Default")
   dotspacemacs-default-layout-name "Default"
   ;; If non nil the default layout name is displayed in the mode-line.
   ;; (default nil)
   dotspacemacs-display-default-layout nil
   ;; If non nil then the last auto saved layouts are resume automatically upon
   ;; start. (default nil)
   dotspacemacs-auto-resume-layouts t
   ;; Location where to auto-save files. Possible values are `original' to
   ;; auto-save the file in-place, `cache' to auto-save the file to another
   ;; file stored in the cache directory and `nil' to disable auto-saving.
   ;; (default 'cache)
   dotspacemacs-auto-save-file-location nil
   ;; If non nil then `ido' replaces `helm' for some commands. For now only
   ;; `find-files' (SPC f f), `find-spacemacs-file' (SPC f e s), and
   ;; `find-contrib-file' (SPC f e c) are replaced. (default nil)
   dotspacemacs-use-ido nil
   ;; If non nil, `helm' will try to miminimize the space it uses. (default nil)
   dotspacemacs-helm-resize nil
   ;; if non nil, the helm header is hidden when there is only one source.
   ;; (default nil)
   dotspacemacs-helm-no-header nil
   ;; define the position to display `helm', options are `bottom', `top',
   ;; `left', or `right'. (default 'bottom)
   dotspacemacs-helm-position 'bottom
   ;; If non nil the paste micro-state is enabled. When enabled pressing `p`
   ;; several times cycle between the kill ring content. (default nil)
   dotspacemacs-enable-paste-micro-state nil
   ;; Which-key delay in seconds. The which-key buffer is the popup listing
   ;; the commands bound to the current keystroke sequence. (default 0.4)
   dotspacemacs-which-key-delay 0.4
   ;; Which-key frame position. Possible values are `right', `bottom' and
   ;; `right-then-bottom'. right-then-bottom tries to display the frame to the
   ;; right; if there is insufficient space it displays it at the bottom.
   ;; (default 'bottom)
   dotspacemacs-which-key-position 'bottom
   ;; If non nil a progress bar is displayed when spacemacs is loading. This
   ;; may increase the boot time on some systems and emacs builds, set it to
   ;; nil to boost the loading time. (default t)
   dotspacemacs-loading-progress-bar t
   ;; If non nil the frame is fullscreen when Emacs starts up. (default nil)
   ;; (Emacs 24.4+ only)
   dotspacemacs-fullscreen-at-startup nil
   ;; If non nil `spacemacs/toggle-fullscreen' will not use native fullscreen.
   ;; Use to disable fullscreen animations in OSX. (default nil)
   dotspacemacs-fullscreen-use-non-native nil
   ;; If non nil the frame is maximized when Emacs starts up.
   ;; Takes effect only if `dotspacemacs-fullscreen-at-startup' is nil.
   ;; (default nil) (Emacs 24.4+ only)
   dotspacemacs-maximized-at-startup nil
   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's active or selected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-active-transparency 90
   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's inactive or deselected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-inactive-transparency 90
   ;; If non nil unicode symbols are displayed in the mode line. (default t)
   dotspacemacs-mode-line-unicode-symbols t
   ;; If non nil smooth scrolling (native-scrolling) is enabled. Smooth
   ;; scrolling overrides the default behavior of Emacs which recenters the
   ;; point when it reaches the top or bottom of the screen. (default t)
   dotspacemacs-smooth-scrolling t
   ;; If non nil line numbers are turned on in all `prog-mode' and `text-mode'
   ;; derivatives. If set to `relative', also turns on relative line numbers.
   ;; (default nil)
   dotspacemacs-line-numbers t
   ;; If non-nil smartparens-strict-mode will be enabled in programming modes.
   ;; (default nil)
   dotspacemacs-smartparens-strict-mode nil
   ;; Select a scope to highlight delimiters. Possible values are `any',
   ;; `current', `all' or `nil'. Default is `all' (highlight any scope and
   ;; emphasis the current one). (default 'all)
   dotspacemacs-highlight-delimiters 'all
   ;; If non nil advises quit functions to keep server open when quitting.
   ;; (default nil)
   dotspacemacs-persistent-server nil
   ;; List of search tool executable names. Spacemacs uses the first installed
   ;; tool of the list. Supported tools are `ag', `pt', `ack' and `grep'.
   ;; (default '("ag" "pt" "ack" "grep"))
   dotspacemacs-search-tools '("ag" "grep")
   ;; The default package repository used if no explicit repository has been
   ;; specified with an installed package.
   ;; Not used for now. (default nil)
   dotspacemacs-default-package-repository nil
   ;; Delete whitespace while saving buffer. Possible values are `all'
   ;; to aggressively delete empty line and long sequences of whitespace,
   ;; `trailing' to delete only the whitespace at end of lines, `changed'to
   ;; delete only whitespace for changed lines or `nil' to disable cleanup.
   ;; (default nil)
   dotspacemacs-whitespace-cleanup 'changed
   ))

(defun dotspacemacs/user-init ()
  "Initialization function for user code.
It is called immediately after `dotspacemacs/init'.  You are free to put any
user code."
  (setq mac-pass-command-to-system nil)
  )

(defun force-save ()
  (interactive)
  (not-modified 1)
  (save-buffer))

(defun dotspacemacs/user-config ()
  (setq custom-file "~/.spacemacs.d/customizations.el")
  (load-file custom-file)
  ;; keybindings
  (define-key key-translation-map "\C-j" "\C-x")
  (global-set-key (kbd "C-x C-s") 'force-save)
  (global-set-key (kbd "M-\\") 'spacemacs/comment-or-uncomment-lines)
  (global-set-key (kbd "C-,") 'spacemacs/indent-region-or-buffer)
  (global-set-key (kbd "C-=") 'text-scale-increase)
  (global-set-key (kbd "C--") 'text-scale-decrease)
  (global-set-key (kbd "C-0") 'text-scale-adjust)
  (global-set-key (kbd "C-<tab>") 'pop-to-mark-command)
  (global-set-key (kbd "M-P") 'md/duplicate-up)
  (global-set-key (kbd "M-N") 'md/duplicate-down)
  (global-set-key (kbd "C-S-p") 'md/move-lines-up)
  (global-set-key (kbd "C-S-n") 'md/move-lines-down)
  (global-set-key (kbd "M-C-h") 'evil-window-left)
  (global-set-key (kbd "M-C-l") 'evil-window-right)
  (global-set-key (kbd "M-C-k") 'evil-window-up)
  (global-set-key (kbd "M-C-j") 'evil-window-down)
  (global-set-key (kbd "C-S-c") 'evil-surround-change)
  (global-set-key (kbd "M-z") 'zop-to-char)
  (global-set-key (kbd "M-W") 'copy-word)
  (define-key flyspell-mode-map (kbd "C-,") 'spacemacs/indent-region-or-buffer)

  ;; evil bindings
  (define-key evil-ex-map (kbd "w") 'force-save)
  (spacemacs/set-leader-keys
    "p a" 'projectile-find-implementation-or-test-other-window
    "p A" 'projectile-toggle-between-implementation-and-test
    )

  ;; settings
  (setq
   projectile-enable-caching nil
   scss-sass-command "/Users/andy/\.rvm/gems/ruby-2\.1\.5@poc-oliver/bin/sass"
   projectile-switch-project-action 'projectile-dired
   custom-theme-directory "~/.spacemacs.d/themes"
   magit-save-repository-buffers nil
   flyspell-prog-text-faces '(font-lock-comment-face font-lock-doc-face)

   ;; spaceline
   spaceline-minor-modes-p nil

   ;; miscellaneous
   require-final-newline t
   )

  ;; spaceline
  (spaceline-toggle-buffer-encoding-abbrev-off)
  (spaceline-toggle-buffer-position-off)
  (spaceline-toggle-hud-off)

  (global-vi-tilde-fringe-mode -1)
  (global-linum-mode 1)

  (add-hook 'term-mode-hook 'spacemacs/toggle-line-numbers-off)

  ;; js2-mode config
  (add-hook 'js2-mode-hook 'spacemacs/toggle-syntax-checking-on)
  (add-hook 'js2-mode-hook
            (lambda ()
              (eslint-set-closest-executable)
              (define-key js2-mode-map (kbd "C-M-.") 'mocha-add-or-remove-only)))

  ;; web-mode config
  (add-hook 'web-mode-hook (lambda ()
                             (eslint-set-closest-executable)))

  ;; powerline config
  (setq powerline-default-separator 'alternate)

  ;; open splits vertically first
  (setq split-height-threshold 65)
  (setq split-width-threshold 160)

  ;; save hooks
  (add-hook 'before-save-hook (lambda ()
                                (auto-make-directory)
                                (whitespace-cleanup)))


  (add-to-list 'auto-mode-alist '("zshrc\\'" . shell-script-mode))
  (add-to-list 'auto-mode-alist '("eslintrc\\'" . json-mode))
  (add-to-list 'auto-mode-alist '("babelrc\\'" . json-mode))
  (add-to-list 'auto-mode-alist '("\\.jsx\\'" . js2-jsx-mode))
  (add-to-list 'auto-mode-alist '("envrc\\'" . shell-script-mode))
  (add-to-list 'auto-mode-alist '("envrc.local\\'" . shell-script-mode))

  (projectile-register-project-type 'npm '("package.json") "npm start" "npm test")

  (add-hook
   'dired-mode-hook
   (lambda ()
     (define-key dired-mode-map (kbd "<backspace>") 'dired-up-directory)))

  (add-hook 'go-mode-hook
            (lambda ()
              (setq
               tab-width 4
               indent-tabs-mode 1)))

  (setq shackle-rules '(
                        (magit-status-mode :align below)))
  (shackle-mode)

  ;; Move text up and down in visual mode with J/K
  (define-key evil-visual-state-map "J"
    (concat ":move '>+1" (kbd "RET") "gv=gv"))
  (define-key evil-visual-state-map "K"
    (concat ":move '<-2" (kbd "RET") "gv=gv"))

  ;; Magit
  ;; Use C-n/C-p to navigate sections
  (with-eval-after-load 'magit
    (evil-define-key 'normal magit-mode-map (kbd "C-n") 'magit-section-forward-sibling)
    (evil-define-key 'normal magit-mode-map (kbd "C-p") 'magit-section-backward-sibling))

  ;; Start in insert mode
  (add-hook 'git-commit-mode-hook 'evil-insert-state)
  )
