#!/bin/bash
#
# Open new iTerm window from the command line
#
# Usage:
#     iterm                   Opens the current directory in a new iTerm window
#     iterm [PATH]            Open PATH in a new iTerm window
#     iterm [CMD]             Open a new iTerm window and execute CMD
#     iterm [PATH] [CMD] ...  You can prob'ly guess
#
#
# References:
#     iTerm AppleScript Examples:
#     https://gitlab.com/gnachman/iterm2/wikis/Applescript
#
# Credit:
#     Inspired by tab.bash by @bobthecow
#     link: https://gist.github.com/bobthecow/757788
#

# OSX only
[ `uname -s` != "Darwin" ] && return

function iterm () {
    local cmd=""
    local wd="$PWD"
    local args="$@"

    if [ -d "$1" ]; then
        wd="$1"
        args="${@:2}"
    fi

    if [ -n "$args" ]; then
        cmd="; $args"
    fi

    osascript &>/dev/null <<EOF
      tell application "iTerm2"
          set newWindow to (create window with default profile)
          tell current session of newWindow
              write text "cd Work/aem/author/crx-quickstart/logs"
              write text "tail -f error.log"
          end tell
      end tell
      tell application "iTerm2"
          set newWindow to (create window with default profile)
          tell current session of newWindow
              write text "cd Work/aem/publish/crx-quickstart/logs"
              write text "tail -f error.log"
          end tell
      end tell
EOF
}
iterm $@
