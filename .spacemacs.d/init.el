(defun dotspacemacs/layers ()
  (setq-default
   dotspacemacs-distribution 'spacemacs
   dotspacemacs-enable-lazy-installation 'unused
   dotspacemacs-ask-for-lazy-installation t
   dotspacemacs-configuration-layer-path '()
   dotspacemacs-configuration-layers
   '(
     python
     rust
     javascript
     html
     xml
     ipython-notebook
     yaml
     javascript
     markdown
     org
     git
     helm
     emacs-lisp
     git
     markdown
     shell
     version-control
     (evil-snipe :variables evil-snipe-enable-alternate-f-and-t-behaviors t)
     themes-megapack
     docker
     (auto-completion :variables
                      auto-completion-return-key-behavior 'complete
                      auto-completion-tab-key-behavior 'cycle
                      auto-completion-complete-with-key-sequence "jk"
                      auto-completion-complete-with-key-sequence-delay 0.1
                      auto-completion-private-snippets-directory "~/.spacemacs.d/snippets"
                      auto-completion-enable-snippets-in-popup t
                      auto-completion-enable-sort-by-usage t)
     ;; better-defaults
     ;; spell-checking
     ;; syntax-checking
     )
   dotspacemacs-additional-packages '()
   dotspacemacs-frozen-packages '()
   dotspacemacs-excluded-packages '()
   dotspacemacs-install-packages 'used-only))

(defun dotspacemacs/init ()
  "Initialization function.
This function is called at the very startup of Spacemacs initialization
before layers configuration.
You should not put any user code in there besides modifying the variable
values."
  (setq-default
   dotspacemacs-elpa-https t
   dotspacemacs-elpa-timeout 5
   dotspacemacs-check-for-update nil
   dotspacemacs-elpa-subdirectory nil
   dotspacemacs-editing-style 'vim
   dotspacemacs-verbose-loading nil
   dotspacemacs-startup-banner 'official
   dotspacemacs-startup-lists '((recents . 5)
                                (projects . 10))
   dotspacemacs-startup-buffer-responsive t
   dotspacemacs-scratch-mode 'org-mode
   ;; dotspacemacs-themes '(white-sand)
   dotspacemacs-themes '(zenburn)
   dotspacemacs-colorize-cursor-according-to-state t
   dotspacemacs-default-font '("Source Code Pro"
                               :size 24
                               :weight normal
                               :width normal
                               :powerline-scale 2.5)
   dotspacemacs-leader-key "SPC"
   dotspacemacs-emacs-command-key "SPC"
   dotspacemacs-ex-command-key ":"
   dotspacemacs-emacs-leader-key "M-m"
   dotspacemacs-major-mode-leader-key ","
   dotspacemacs-major-mode-emacs-leader-key "C-M-m"
   dotspacemacs-distinguish-gui-tab nil
   dotspacemacs-remap-Y-to-y$ nil
   dotspacemacs-retain-visual-state-on-shift t
   dotspacemacs-visual-line-move-text nil
   dotspacemacs-ex-substitute-global nil
   dotspacemacs-default-layout-name "Default"
   dotspacemacs-display-default-layout nil
   dotspacemacs-autosave-file-directly nil
   dotspacemacs-auto-resume-layouts nil
   dotspacemacs-large-file-size 1
   dotspacemacs-auto-save-file-location 'original
   dotspacemacs-max-rollback-slots 9999
   dotspacemacs-helm-resize nil
   dotspacemacs-helm-no-header nil
   dotspacemacs-helm-position 'bottom
   dotspacemacs-helm-use-fuzzy 'always
   dotspacemacs-enable-paste-transient-state nil
   dotspacemacs-which-key-delay 0.1
   dotspacemacs-which-key-position 'bottom
   dotspacemacs-loading-progress-bar t
   dotspacemacs-fullscreen-at-startup nil
   dotspacemacs-fullscreen-use-non-native nil
   dotspacemacs-maximized-at-startup nil
   dotspacemacs-active-transparency 90
   dotspacemacs-inactive-transparency 90
   dotspacemacs-show-transient-state-title t
   dotspacemacs-show-transient-state-color-guide t
   dotspacemacs-mode-line-unicode-symbols t
   dotspacemacs-smooth-scrolling t
   dotspacemacs-line-numbers t
   dotspacemacs-folding-method 'evil
   dotspacemacs-smartparens-strict-mode nil
   dotspacemacs-smart-closing-parenthesis t
   dotspacemacs-highlight-delimiters 'all
   dotspacemacs-persistent-server nil
   dotspacemacs-search-tools '("ag" "pt" "ack" "grep")
   dotspacemacs-default-package-repository nil
   dotspacemacs-whitespace-cleanup nil
   ))



(defun dotspacemacs/user-init ()





  ;; (if (charsetp 'unicode-bmp)
  ;;     (progn
  ;;       (prefer-coding-system 'utf-8)
  ;;       (set-default-font "Bitstream Vera Sans Mono-12:weight=bold"))
  ;;   (set-default-font "-misc-fixed-bold-*-normal-*-14-*-75-75-*-*-iso8859-15")
  ;;   (if (not (assoc "UTF-8" language-info-alist))
  ;;       (set-language-environment "latin-9")
  ;;     (set-language-environment "utf-8")
  ;;     (set-keyboard-coding-system 'utf-8)
  ;;     (set-terminal-coding-system 'utf-8)
  ;;     (prefer-coding-system 'utf-8)))



  "Initialization function for user code.
It is called immediately after `dotspacemacs/init', before layer configuration
executes.
 This function is mostly useful for variables that need to be set
before packages are loaded. If you are unsure, you should try in setting them in
`dotspacemacs/user-config' first."
  )

(defun dotspacemacs/user-config ()
  (add-hook 'hack-local-variables-hook (lambda () (setq truncate-lines t)))
  (spacemacs|use-package-add-hook evil-surround
    :post-config
    (evil-define-key 'visual evil-surround-mode-map "s" 'evil-substitute)
    (evil-define-key 'visual evil-surround-mode-map "S" 'evil-surround-region))

  (add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))
  (add-to-list 'auto-mode-alist '("\\.jsx\\'" . js2-mode))
  (setq prettier-js-args '(
                           "--trailing-comma" "es5"
                           "--bracket-spacing" "false"
                           "--tab-width" "2"
                           ))
  (spacemacs/set-leader-keys-for-major-mode 'ein:ipynb-mode "ayr" 'ein:notebook-restart-session-command)

  (defun my-setup-indent (n)
    ;; java/c/c++
    (setq c-basic-offset n)
    ;; web development
    (setq coffee-tab-width n) ; coffeescript
    (setq javascript-indent-level n) ; javascript-mode
    (setq js-indent-level n) ; js-mode
    (setq js2-basic-offset n) ; js2-mode, in latest js2-mode, it's alias of js-indent-level
    (setq web-mode-markup-indent-offset n) ; web-mode, html tag in html file
    (setq web-mode-css-indent-offset n) ; web-mode, css in html file
    (setq web-mode-code-indent-offset n) ; web-mode, js code in html file
    (setq css-indent-offset n) ; css-mode
    )
  (my-setup-indent 2) ;

  (require 'hideshow)
  (require 'sgml-mode)
  (require 'nxml-mode)

  (add-to-list 'hs-special-modes-alist
               '(nxml-mode
                 "<!--\\|<[^/>]*[^/]>"
                 "-->\\|</[^/>]*[^/]>"
                 "<!--"
                 sgml-skip-tag-forward
                 nil))


  (add-hook 'nxml-mode-hook 'hs-minor-mode)

  ;; optional key bindings, easier than hs defaults
  (define-key nxml-mode-map (kbd "C-c f") 'hs-toggle-hiding)


)

;; Do not write anything past this comment. This is where Emacs will
;; auto-generate custom variable definitions.
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (yapfify pyvenv pytest pyenv-mode py-isort pip-requirements live-py-mode hy-mode helm-pydoc cython-mode company-anaconda anaconda-mode pythonic tide csv-mode ein polymode deferred websocket yaml-mode toml-mode racer flycheck-rust cargo rust-mode prettier-js rjsx-mode lsp-javascript-typescript typescript-mode lsp-mode ht indium zenburn-theme zen-and-art-theme xterm-color white-sand-theme web-mode web-beautify unfill underwater-theme ujelly-theme twilight-theme twilight-bright-theme twilight-anti-bright-theme toxi-theme tao-theme tangotango-theme tango-plus-theme tango-2-theme tagedit sunny-day-theme sublime-themes subatomic256-theme subatomic-theme spacegray-theme soothe-theme solarized-theme soft-stone-theme soft-morning-theme soft-charcoal-theme smyx-theme smeargle slim-mode shell-pop seti-theme scss-mode sass-mode reverse-theme rebecca-theme railscasts-theme purple-haze-theme pug-mode professional-theme planet-theme phoenix-dark-pink-theme phoenix-dark-mono-theme orgit organic-green-theme org-projectile org-category-capture org-present org-pomodoro alert log4e gntp org-mime org-download omtose-phellack-theme oldlace-theme occidental-theme obsidian-theme noctilux-theme naquadah-theme mwim mustang-theme multi-term monokai-theme monochrome-theme molokai-theme moe-theme mmm-mode minimal-theme material-theme markdown-toc markdown-mode majapahit-theme magit-gitflow madhat2r-theme lush-theme livid-mode skewer-mode simple-httpd light-soap-theme js2-refactor multiple-cursors js2-mode js-doc jbeans-theme jazz-theme ir-black-theme inkpot-theme htmlize heroku-theme hemisu-theme helm-gitignore helm-css-scss helm-company helm-c-yasnippet hc-zenburn-theme haml-mode gruvbox-theme gruber-darker-theme grandshell-theme gotham-theme gnuplot gitignore-mode gitconfig-mode gitattributes-mode git-timemachine git-messenger git-link git-gutter-fringe+ git-gutter-fringe fringe-helper git-gutter+ git-gutter gh-md gandalf-theme fuzzy flyspell-correct-helm flyspell-correct flycheck-pos-tip pos-tip flycheck flatui-theme flatland-theme farmhouse-theme exotica-theme evil-snipe evil-magit magit transient git-commit with-editor espresso-theme eshell-z eshell-prompt-extras esh-help emmet-mode dracula-theme dockerfile-mode docker json-mode tablist magit-popup docker-tramp json-snatcher json-reformat django-theme diff-hl darktooth-theme autothemer darkokai-theme darkmine-theme darkburn-theme dakrone-theme cyberpunk-theme company-web web-completion-data company-tern dash-functional tern company-statistics company color-theme-sanityinc-tomorrow color-theme-sanityinc-solarized coffee-mode clues-theme cherry-blossom-theme busybee-theme bubbleberry-theme birds-of-paradise-plus-theme badwolf-theme auto-yasnippet yasnippet auto-dictionary apropospriate-theme anti-zenburn-theme ample-zen-theme ample-theme alect-themes afternoon-theme ac-ispell auto-complete ws-butler winum which-key volatile-highlights vi-tilde-fringe uuidgen use-package toc-org spaceline powerline restart-emacs request rainbow-delimiters popwin persp-mode pcre2el paradox spinner org-plus-contrib org-bullets open-junk-file neotree move-text macrostep lorem-ipsum linum-relative link-hint indent-guide hydra lv hungry-delete hl-todo highlight-parentheses highlight-numbers parent-mode highlight-indentation helm-themes helm-swoop helm-projectile projectile pkg-info epl helm-mode-manager helm-make helm-flx helm-descbinds helm-ag google-translate golden-ratio flx-ido flx fill-column-indicator fancy-battery eyebrowse expand-region exec-path-from-shell evil-visualstar evil-visual-mark-mode evil-unimpaired evil-tutor evil-surround evil-search-highlight-persist highlight evil-numbers evil-nerd-commenter evil-mc evil-matchit evil-lisp-state smartparens evil-indent-plus evil-iedit-state iedit evil-exchange evil-escape evil-ediff evil-args evil-anzu anzu evil goto-chg undo-tree eval-sexp-fu elisp-slime-nav dumb-jump f dash s diminish define-word column-enforce-mode clean-aindent-mode bind-map bind-key auto-highlight-symbol auto-compile packed aggressive-indent adaptive-wrap ace-window ace-link ace-jump-helm-line helm avy helm-core popup async))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:foreground "#DCDCCC" :background "#3F3F3F")))))
