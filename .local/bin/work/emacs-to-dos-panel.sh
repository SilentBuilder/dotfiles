#!/bin/bash

emacs --eval "(progn
    (split-window-right)
    (find-file \"~/.hidden/Notes/Index.org\")
    (other-window 1)
    (find-file \"~/.hidden/Notes/Academic.org\")
    (other-window 1)
    (my/open-daily-tracker-only))"
