# arch-command-not-found
Simple command not found handler for Arch Linux.

## Dependencies
- pkgfile
- paru

## Installation
- Copy the `arch-command-not-found` file to a directory of your choice (I'll refer the script under that path as `$ACMDNF_PATH`)
- Append the following line to your `~/.bashrc`: `. $ACMDNF_PATH`
- Restart bash or run the following command to reconfigure bash: `source ~/.bashrc`

## To-Do list
[ ] Add support for other shells.

[ ] Make it available on the Arch User Repository.
