#!/bin/bash
command_not_found_handle() {
	# Check if pkgfile is installed
	if ! command -v pkgfile &>/dev/null; then
    		echo "pkgfile is not installed. Please install it using 'sudo pacman -S pkgfile'."
    		exit 1
	fi

	# Get the missing command
	missing_command="$1"

	# Search for the package providing the missing command
	package=$(pkgfile -b "$missing_command" | head -n 1)

	if [ -n "$package" ]; then
    		echo "Command '$missing_command' not found. The package '$package' provides it."
    
    		read -rp "Do you want to install '$package'? (Y/n): " choice
    		case "$choice" in
        		[Yy]|''*)
            		# Check if paru is installed (for AUR packages)
            		if command -v paru &>/dev/null; then
                		sudo paru --noconfirm -S "$package"
            		else
                		sudo pacman --noconfirm -S "$package"
            		fi
			# if the user responds the prompts with a no, exit
			if [ $? == 1 ]; then 
				exit 1
			fi
            		;;
        		*)
            			echo "Package installation skipped."
				exit 1
            		;;
    		esac
		"$missing_command" ${@:2}
	else
    		echo "Command '$missing_command' not found, and no package provides it."
	fi
}
