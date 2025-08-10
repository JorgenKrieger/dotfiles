# Navigation & Globbing
setopt AUTO_CD           # cd into a folder by typing its name
setopt AUTO_PUSHD        # Push old dir onto stack when using cd
setopt CORRECT           # Correct command spelling mistakes
setopt EXTENDED_GLOB     # Advanced globbing syntax
setopt PUSHD_IGNORE_DUPS # Don't store duplicate dirs in the stack
setopt PUSHD_SILENT      # Don't print dir stack after pushd/popd

# Completions & Menus
setopt MENU_COMPLETE     # Automatically list choices on tab complete
setopt COMPLETE_IN_WORD  # Tab completion works in the middle of a word
setopt ALWAYS_TO_END     # Cursor moves to end after completion

# Safety
setopt NO_CLOBBER        # Prevent overwriting files with '>'
setopt RM_STAR_SILENT    # Don't ask 'are you sure?' for rm *

# History (you already have most)
setopt HIST_REDUCE_BLANKS # Remove superfluous blanks from history
setopt HIST_IGNORE_DUPS  # Skip duplicate commands in history
setopt HIST_IGNORE_SPACE # Skip commands starting with space
setopt HIST_FIND_NO_DUPS # No duplicates when searching history
setopt SHARE_HISTORY     # Share history between sessions
