unmap <Space>

imap kj <Esc>

" Have j and k navigate visual lines rather than logical ones
nmap j gj
nmap k gk
vmap j gj
vmap k gk
nmap H g^
nmap L g$
vmap H g^
vmap L g$
omap L g$
omap H g^

vmap q <Esc>

" Yank to system clipboard
set clipboard=unnamed

" Go back and forward
" (make sure to remove default Obsidian shortcuts for these to work)
exmap back obcommand app:go-back
nmap gb :back<CR>
exmap forward obcommand app:go-forward
nmap gf :forward<CR>
" Go Into Link
exmap goto_link obcommand editor:follow-link
nmap gt :goto_link<CR>

" Here's an example config that implements many of the features from vim-surround:
exmap surround_wiki surround [[ ]]
exmap surround_double_quotes surround " "
exmap surround_single_quotes surround ' '
exmap surround_brackets surround ( )
exmap surround_square_brackets surround [ ]
exmap surround_curly_brackets surround { }

" NOTE: must use 'map' and not 'nmap'
map [[ :surround_wiki
nunmap s
vunmap s
nmap s" :surround_double_quotes
nmap s' :surround_single_quotes
nmap sb :surround_brackets
nmap s( :surround_brackets
nmap s) :surround_brackets
nmap s[ :surround_square_brackets
nmap s] :surround_square_brackets
nmap s{ :surround_curly_brackets
nmap s} :surround_curly_brackets
vmap s" :surround_double_quotes
vmap s' :surround_single_quotes
vmap sb :surround_brackets
vmap s( :surround_brackets
vmap s) :surround_brackets
vmap s[ :surround_square_brackets
vmap s] :surround_square_brackets
vmap s{ :surround_curly_brackets
vmap s} :surround_curly_brackets

" Emulate Original Folding command https://vimhelp.org/fold.txt.html#fold-commands
exmap togglefold obcommand editor:toggle-fold
exmap unfoldall obcommand editor:unfold-all
exmap foldall obcommand editor:fold-all
nmap za :togglefold
nmap zo :unfoldall
nmap zc :foldall

" Tabs
exmap tabnext obcommand workspace:next-tab
nmap <Tab> :tabnext<CR>
exmap tabprev obcommand workspace:previous-tab
nmap <S-Tab> :tabprev<CR>

" Split Window
exmap split_vertical obcommand workspace:split-vertical
nmap sv :split_vertical<CR>
exmap split_horizontal obcommand workspace:split-horizontal
nmap sh :split_horizontal<CR>

" contextMenu
exmap contextMenu obcommand editor:context-menu
nmap K :contextMenu<CR>
vmap K :contextMenu<CR>


" Search-replace
exmap searchAndReplace obcommand editor:open-search-replace
nmap sr :searchAndReplace<CR>

"
"""""""""""""""""""""""""""""""""""""""""""""""" "
"""""""""""" All Available Commands """""""""""" "
" :obcommand and <opt + cmd + i> to open console "
"""""""""""""""""""""""""""""""""""""""""""""""" "
" Available commands:
" editor:save-file
" editor:follow-link
" editor:open-link-in-new-leaf
" editor:open-link-in-new-window
" workspace:toggle-pin
" editor:open-link-in-new-split
" editor:focus-top
" editor:focus-bottom
" editor:focus-left
" editor:focus-right
" workspace:split-vertical
" workspace:split-horizontal
" workspace:toggle-stacked-tabs
" workspace:edit-file-title
" workspace:copy-path
" workspace:copy-url
" workspace:undo-close-pane
" workspace:export-pdf
" editor:rename-heading
" workspace:open-in-new-window
" workspace:move-to-new-window
" workspace:next-tab
" workspace:goto-tab-1
" workspace:goto-tab-2
" workspace:goto-tab-3
" workspace:goto-tab-4
" workspace:goto-tab-5
" workspace:goto-tab-6
" workspace:goto-tab-7
" workspace:goto-tab-8
" workspace:goto-last-tab
" workspace:previous-tab
" workspace:new-tab
" workspace:show-trash
" obsidian-minimal-settings:increase-body-font-size
" obsidian-minimal-settings:decrease-body-font-size
" obsidian-minimal-settings:toggle-minimal-dark-cycle
" obsidian-minimal-settings:toggle-minimal-light-cycle
" obsidian-minimal-settings:toggle-hidden-borders
" obsidian-minimal-settings:toggle-colorful-headings
" obsidian-minimal-settings:toggle-minimal-focus-mode
" obsidian-minimal-settings:toggle-minimal-colorful-frame
" obsidian-minimal-settings:cycle-minimal-table-width
" obsidian-minimal-settings:cycle-minimal-image-width
" obsidian-minimal-settings:cycle-minimal-iframe-width
" obsidian-minimal-settings:cycle-minimal-chart-width
" obsidian-minimal-settings:cycle-minimal-map-width
" obsidian-minimal-settings:toggle-minimal-img-grid
" obsidian-minimal-settings:toggle-minimal-switch
" obsidian-minimal-settings:toggle-minimal-light-default
" obsidian-minimal-settings:toggle-minimal-light-white
" obsidian-minimal-settings:toggle-minimal-light-tonal
" obsidian-minimal-settings:toggle-minimal-light-contrast
" obsidian-minimal-settings:toggle-minimal-dark-default
" obsidian-minimal-settings:toggle-minimal-dark-tonal
" obsidian-minimal-settings:toggle-minimal-dark-black
" obsidian-minimal-settings:toggle-minimal-atom-light
" obsidian-minimal-settings:toggle-minimal-ayu-light
" obsidian-minimal-settings:toggle-minimal-catppuccin-light
" obsidian-minimal-settings:toggle-minimal-default-light
" obsidian-minimal-settings:toggle-minimal-gruvbox-light
" obsidian-minimal-settings:toggle-minimal-eink-light
" obsidian-minimal-settings:toggle-minimal-everforest-light
" obsidian-minimal-settings:toggle-minimal-flexoki-light
" obsidian-minimal-settings:toggle-minimal-macos-light
" obsidian-minimal-settings:toggle-minimal-notion-light
" obsidian-minimal-settings:toggle-minimal-nord-light
" obsidian-minimal-settings:toggle-minimal-rose-pine-light
" obsidian-minimal-settings:toggle-minimal-solarized-light
" obsidian-minimal-settings:toggle-minimal-things-light
" obsidian-minimal-settings:toggle-minimal-atom-dark
" obsidian-minimal-settings:toggle-minimal-ayu-dark
" obsidian-minimal-settings:toggle-minimal-catppuccin-dark
" obsidian-minimal-settings:toggle-minimal-dracula-dark
" obsidian-minimal-settings:toggle-minimal-default-dark
" obsidian-minimal-settings:toggle-minimal-eink-dark
" obsidian-minimal-settings:toggle-minimal-everforest-dark
" obsidian-minimal-settings:toggle-minimal-flexoki-dark
" obsidian-minimal-settings:toggle-minimal-gruvbox-dark
" obsidian-minimal-settings:toggle-minimal-macos-dark
" obsidian-minimal-settings:toggle-minimal-nord-dark
" obsidian-minimal-settings:toggle-minimal-notion-dark
" obsidian-minimal-settings:toggle-minimal-rose-pine-dark
" obsidian-minimal-settings:toggle-minimal-solarized-dark
" obsidian-minimal-settings:toggle-minimal-things-dark
" obsidian-minimal-settings:toggle-minimal-dev-block-width
" obsidian-git:edit-gitignore
" obsidian-git:open-git-view
" obsidian-git:open-history-view
" obsidian-git:open-diff-view
" obsidian-git:view-file-on-github
" obsidian-git:view-history-on-github
" obsidian-git:pull
" obsidian-git:fetch
" obsidian-git:switch-to-remote-branch
" obsidian-git:add-to-gitignore
" obsidian-git:push
" obsidian-git:backup-and-close
" obsidian-git:commit-push-specified-message
" obsidian-git:commit
" obsidian-git:commit-specified-message
" obsidian-git:commit-staged
" obsidian-git:commit-amend-staged-specified-message
" obsidian-git:commit-staged-specified-message
" obsidian-git:push2
" obsidian-git:stage-current-file
" obsidian-git:unstage-current-file
" obsidian-git:edit-remotes
" obsidian-git:remove-remote
" obsidian-git:set-upstream-branch
" obsidian-git:delete-repo
" obsidian-git:init-repo
" obsidian-git:clone-repo
" obsidian-git:list-changed-files
" obsidian-git:switch-branch
" obsidian-git:create-branch
" obsidian-git:delete-branch
" obsidian-git:discard-all
" obsidian-git:toggle-line-author-info
" obsidian-importer:open-modal
" recent-files-obsidian:recent-files-open
" omnisearch:show-modal
" omnisearch:show-modal-infile
" table-editor-obsidian:next-row
" table-editor-obsidian:next-cell
" table-editor-obsidian:previous-cell
" table-editor-obsidian:format-table
" table-editor-obsidian:format-all-tables
" table-editor-obsidian:insert-column
" table-editor-obsidian:insert-row
" table-editor-obsidian:escape-table
" table-editor-obsidian:left-align-column
" table-editor-obsidian:center-align-column
" table-editor-obsidian:right-align-column
" table-editor-obsidian:move-column-left
" table-editor-obsidian:move-column-right
" table-editor-obsidian:move-row-up
" table-editor-obsidian:move-row-down
" table-editor-obsidian:delete-column
" table-editor-obsidian:delete-row
" table-editor-obsidian:sort-rows-ascending
" table-editor-obsidian:sort-rows-descending
" table-editor-obsidian:transpose
" table-editor-obsidian:evaluate-formulas
" table-editor-obsidian:table-control-bar
" dataview:dataview-force-refresh-views
" dataview:dataview-drop-cache
" dataview:dataview-rebuild-current-view
" obsidian-icon-folder:iconize:set-icon-for-file
" obsidian-tasks-plugin:edit-task
" obsidian-tasks-plugin:toggle-done
" app:go-back
" app:go-forward
" app:open-vault
" theme:use-dark
" theme:use-light
" theme:switch
" app:open-settings
" app:show-release-notes
" markdown:toggle-preview
" markdown:add-metadata-property
" markdown:add-alias
" markdown:edit-metadata-property
" markdown:clear-metadata-properties
" workspace:close
" workspace:close-window
" workspace:close-others
" workspace:close-tab-group
" workspace:close-others-tab-group
" app:delete-file
" app:toggle-ribbon
" app:toggle-left-sidebar
" app:toggle-right-sidebar
" app:toggle-default-new-pane-mode
" app:open-help
" app:reload
" app:show-debug-info
" app:open-sandbox-vault
" window:toggle-always-on-top
" window:zoom-in
" window:zoom-out
" window:reset-zoom
" file-explorer:new-file
" file-explorer:new-file-in-current-tab
" file-explorer:new-file-in-new-pane
" open-with-default-app:open
" file-explorer:move-file
" file-explorer:duplicate-file
" open-with-default-app:show
" editor:toggle-source
" editor:open-search
" editor:open-search-replace
" editor:focus
" editor:toggle-fold-properties
" editor:toggle-fold
" editor:fold-all
" editor:unfold-all
" editor:fold-less
" editor:fold-more
" editor:insert-wikilink
" editor:insert-embed
" editor:insert-link
" editor:insert-tag
" editor:set-heading
" editor:set-heading-0
" editor:set-heading-1
" editor:set-heading-2
" editor:set-heading-3
" editor:set-heading-4
" editor:set-heading-5
" editor:set-heading-6
" editor:toggle-bold
" editor:toggle-italics
" editor:toggle-strikethrough
" editor:toggle-highlight
" editor:toggle-code
" editor:toggle-inline-math
" editor:toggle-blockquote
" editor:toggle-comments
" editor:clear-formatting
" editor:toggle-bullet-list
" editor:toggle-numbered-list
" editor:toggle-checklist-status
" editor:cycle-list-checklist
" editor:insert-callout
" editor:insert-codeblock
" editor:insert-horizontal-rule
" editor:insert-mathblock
" editor:insert-table
" editor:swap-line-up
" editor:swap-line-down
" editor:attach-file
" editor:delete-paragraph
" editor:add-cursor-below
" editor:add-cursor-above
" editor:toggle-spellcheck
" editor:table-row-before
" editor:table-row-after
" editor:table-row-up
" editor:table-row-down
" editor:table-row-copy
" editor:table-row-delete
" editor:table-col-before
" editor:table-col-after
" editor:table-col-left
" editor:table-col-right
" editor:table-col-copy
" editor:table-col-delete
" editor:table-col-align-left
" editor:table-col-align-center
" editor:table-col-align-right
" editor:context-menu
" file-explorer:open
" file-explorer:reveal-active-file
" file-explorer:new-folder
" global-search:open
" switcher:open
" graph:open
" graph:open-local
" graph:animate
" backlink:open
" backlink:open-backlinks
" backlink:toggle-backlinks-in-document
" canvas:new-file
" canvas:export-as-image
" canvas:jump-to-group
" canvas:convert-to-file
" outgoing-links:open
" outgoing-links:open-for-current
" tag-pane:open
" daily-notes
" daily-notes:goto-prev
" daily-notes:goto-next
" insert-template
" insert-current-date
" insert-current-time
" note-composer:merge-file
" note-composer:split-file
" note-composer:extract-heading
" command-palette:open
" bookmarks:open
" bookmarks:bookmark-current-view
" bookmarks:bookmark-current-search
" bookmarks:unbookmark-current-view
" bookmarks:bookmark-current-section
" bookmarks:bookmark-current-heading
" bookmarks:bookmark-all-tabs
" outline:open
" outline:open-for-current
" slides:start
" file-recovery:open
" obsidian-excalidraw-plugin:excalidraw-convert-image-from-url-to-local-file
" obsidian-excalidraw-plugin:excalidraw-unzip-file
" obsidian-excalidraw-plugin:excalidraw-publish-svg-check
" obsidian-excalidraw-plugin:excalidraw-embeddable-poroperties
" obsidian-excalidraw-plugin:excalidraw-embeddables-relative-scale
" obsidian-excalidraw-plugin:open-image-excalidraw-source
" obsidian-excalidraw-plugin:excalidraw-disable-autosave
" obsidian-excalidraw-plugin:excalidraw-enable-autosave
" obsidian-excalidraw-plugin:excalidraw-download-lib
" obsidian-excalidraw-plugin:excalidraw-open
" obsidian-excalidraw-plugin:excalidraw-open-on-current
" obsidian-excalidraw-plugin:excalidraw-insert-transclusion
" obsidian-excalidraw-plugin:excalidraw-insert-last-active-transclusion
" obsidian-excalidraw-plugin:excalidraw-autocreate
" obsidian-excalidraw-plugin:excalidraw-autocreate-newtab
" obsidian-excalidraw-plugin:excalidraw-autocreate-on-current
" obsidian-excalidraw-plugin:excalidraw-autocreate-popout
" obsidian-excalidraw-plugin:excalidraw-autocreate-and-embed
" obsidian-excalidraw-plugin:excalidraw-autocreate-and-embed-new-tab
" obsidian-excalidraw-plugin:excalidraw-autocreate-and-embed-on-current
" obsidian-excalidraw-plugin:excalidraw-autocreate-and-embed-popout
" obsidian-excalidraw-plugin:run-ocr
" obsidian-excalidraw-plugin:rerun-ocr
" obsidian-excalidraw-plugin:run-ocr-selectedelements
" obsidian-excalidraw-plugin:search-text
" obsidian-excalidraw-plugin:fullscreen
" obsidian-excalidraw-plugin:disable-binding
" obsidian-excalidraw-plugin:disable-framerendering
" obsidian-excalidraw-plugin:frame-settings
" obsidian-excalidraw-plugin:copy-link-to-drawing
" obsidian-excalidraw-plugin:disable-frameclipping
" obsidian-excalidraw-plugin:export-image
" obsidian-excalidraw-plugin:save
" obsidian-excalidraw-plugin:toggle-lock
" obsidian-excalidraw-plugin:scriptengine-store
" obsidian-excalidraw-plugin:delete-file
" obsidian-excalidraw-plugin:convert-text2MD
" obsidian-excalidraw-plugin:insert-link
" obsidian-excalidraw-plugin:insert-command
" obsidian-excalidraw-plugin:insert-link-to-element
" obsidian-excalidraw-plugin:insert-link-to-element-group
" obsidian-excalidraw-plugin:insert-link-to-element-frame
" obsidian-excalidraw-plugin:insert-link-to-element-frame-clipped
" obsidian-excalidraw-plugin:insert-link-to-element-area
" obsidian-excalidraw-plugin:toggle-lefthanded-mode
" obsidian-excalidraw-plugin:flip-image
" obsidian-excalidraw-plugin:reset-image-to-100
" obsidian-excalidraw-plugin:reset-image-ar
" obsidian-excalidraw-plugin:open-link-props
" obsidian-excalidraw-plugin:convert-card-to-file
" obsidian-excalidraw-plugin:insert-active-pdfpage
" obsidian-excalidraw-plugin:crop-image
" obsidian-excalidraw-plugin:annotate-image
" obsidian-excalidraw-plugin:insert-image
" obsidian-excalidraw-plugin:import-svg
" obsidian-excalidraw-plugin:release-notes
" obsidian-excalidraw-plugin:tray-mode
" obsidian-excalidraw-plugin:insert-md
" obsidian-excalidraw-plugin:insert-pdf
" obsidian-excalidraw-plugin:universal-add-file
" obsidian-excalidraw-plugin:universal-card
" obsidian-excalidraw-plugin:insert-LaTeX-symbol
" obsidian-excalidraw-plugin:toggle-excalidraw-view
" obsidian-excalidraw-plugin:convert-to-excalidraw
" obsidian-excalidraw-plugin:convert-excalidraw
" obsidian-annotator:toggle-annotation-mode
