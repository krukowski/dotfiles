(add-to-list 'load-path "~/.emacs.d/lisp")
(setq-default indent-tabs-mode nil)
(setq tab-width 4)
(setq-default show-trailing-whitespace 't)
(show-paren-mode 1)
(setq vc-follow-symlinks nil)
(setq completions-format 'vertical)

(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
                         ("marmalade" . "https://marmalade-repo.org/packages/")
                         ("melpa" . "http://melpa.org/packages/")))

(setq
 backup-by-copying t      ; don't clobber symlinks
 backup-directory-alist
 '(("." . "~/.saves"))    ; don't litter my fs tree
 delete-old-versions t
 kept-new-versions 6
 kept-old-versions 2
    version-control t)       ; use versioned backups

;; pyflakes
(add-to-list 'load-path "~/.emacs.d/vendor")

;; rainbow parens
(custom-set-faces
 '(rainbow-delimiters-depth-1-face ((t (:foreground "orange"))))
 '(rainbow-delimiters-depth-2-face ((t (:foreground "pink"))))
 '(rainbow-delimiters-depth-3-face ((t (:foreground "chartreuse"))))
 '(rainbow-delimiters-depth-4-face ((t (:foreground "sky blue"))))
 '(rainbow-delimiters-depth-5-face ((t (:foreground "yellow"))))
 '(rainbow-delimiters-depth-6-face ((t (:foreground "orchid"))))
 '(rainbow-delimiters-depth-7-face ((t (:foreground "green"))))
 '(rainbow-delimiters-depth-8-face ((t (:foreground "sienna1")))))
(add-hook 'clojure-mode-hook 'rainbow-delimiters-mode)


(add-hook 'find-file-hook 'flymake-find-file-hook)
(when (load "flymake" t)
 (defun flymake-pyflakes-init ()
   (let* ((temp-file (flymake-init-create-temp-buffer-copy
              'flymake-create-temp-inplace))
      (local-file (file-relative-name
           temp-file
           (file-name-directory buffer-file-name))))
     (list "pycheckers"  (list local-file))))
  (add-to-list 'flymake-allowed-file-name-masks
            '("\\.py\\'" flymake-pyflakes-init)))
(load-library "flymake-cursor")

(defun flymake-display-warning (warning)
  (message warning))

(global-set-key (kbd "C-c .") `flymake-mode)


;; TAGS
(defun find-file-upwards (file-to-find)
  "Recursively searches each parent directory starting from the default-directory.
looking for a file with name file-to-find.  Returns the path to it
or nil if not found."
  (labels
      ((find-file-r (path)
                    (let* ((parent (file-name-directory path))
                           (possible-file (concat parent file-to-find)))
                      (cond
                       ((file-exists-p possible-file) possible-file) ; Found
                       ;; The parent of ~ is nil and the parent of / is itself.
                       ;; Thus the terminating condition for not finding the file
                       ;; accounts for both.
                       ((or (null parent) (equal parent (directory-file-name parent))) nil) ; Not found
                       (t (find-file-r (directory-file-name parent))))))) ; Continue
    (find-file-r default-directory)))
(let ((my-tags-file (find-file-upwards "TAGS")))
  (when my-tags-file
    (message "Loading tags file: %s" my-tags-file)
    (visit-tags-table my-tags-file)))

(setq tags-revert-without-query t)

(defun create-tags (dir-name)
    "Create tags file."
    (shell-command
     "find -f ~/src/superfly/TAGS ~/src/superfly/ -name '*.py' | xargs etags")
)


;; ropemacs
;; (require 'pymacs)
;; (pymacs-load "ropemacs" "rope-")
;; (setq ropemacs-enable-autoimport t)


;; auto complete
;; (add-to-list 'load-path "~/.emacs.d/vendor/auto-complete-1.2")
;; (require 'auto-complete-config)
;; (add-to-list 'ac-dictionary-directories "~/.emacs.d/vendor/auto-complete-1.2/dict")
;; (ac-config-default)


;; Smooth Scrolling
(setq mouse-wheel-scroll-amount '(1 ((shift) . 1))) ;; one line at a time
(setq mouse-wheel-progressive-speed nil) ;; don't accelerate scrolling
(setq mouse-wheel-follow-mouse 't) ;; scroll window under mouse
(setq scroll-step 1) ;; keyboard scroll one line at a time

(setq frame-title-format
      (list (format "%s %%S: %%j " (system-name))
        '(buffer-file-name "%f" (dired-directory dired-directory "%b"))))

(column-number-mode 1)

(setq-default c-basic-offset 4)

(require 'column-marker)
(add-hook 'after-change-major-mode-hook
	    (lambda ()
	        (interactive)
		    (column-marker-1 79)))

(global-set-key [C-tab] 'next-buffer)
(global-set-key [C-S-tab] 'previous-buffer)


(defun backward-delete-word (arg)
  "Delete characters backward until encountering the beginning of a word.
With argument ARG, do this that many times."
  (interactive "p")
  (delete-region (point) (progn (backward-word arg) (point))))

(define-key minibuffer-local-map [M-backspace] 'backward-delete-word)
(define-key minibuffer-local-map [C-backspace] 'backward-delete-word)

(when (display-graphic-p)
  (invert-face 'default))

(autoload 'lua-mode "lua-mode" "Lua editing mode." t)
(add-to-list 'auto-mode-alist '("\\.lua$" . lua-mode))
(add-to-list 'interpreter-mode-alist '("lua" . lua-mode))
(setq lua-indent-level 4)


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(inhibit-startup-screen t))

(kill-buffer "*scratch*")
(add-to-list 'load-path "~/.emacs.d/el-get/el-get")
(add-to-list 'load-path "~/.emacs.d/el-get")

;; (unless (require 'el-get nil 'noerror)
;;   (with-current-buffer
;;       (url-retrieve-synchronously
;;        "https://raw.github.com/dimitri/el-get/master/el-get-install.el")
;;     (goto-char (point-max))
;;     (eval-print-last-sexp)))

;; (add-to-list 'el-get-recipe-path "~/.emacs.d/el-get-user/recipes")
;; (el-get 'sync)

