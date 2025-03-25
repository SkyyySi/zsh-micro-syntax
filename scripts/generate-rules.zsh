#!/usr/bin/env zsh
setopt no_unset err_exit pipe_fail

function write_array() {
	emulate -L zsh

	printf -- '%q\n' "${@}"
}

function read_array() {
	#emulate -L zsh

	if (( $# == 1 )); then
		IFS=$'\n' read -t -r -d '' -A -- 'x' <<< "$1"
	elif (( $# == 2 )); then
		IFS="$2"  read -t -r -d '' -A -- 'x' <<< "$1"
	else
		return 1
	fi

	shift -p -- "$1"
}

function get_builtins() {
	emulate -L zsh

	local -a exclude=(
		''
	)

	local -a result=()

	local k v
	for k v in "${(kv)builtins[@]}"; do
		if [[ "$v" != 'defined' ]]; then
			continue
		fi

		result+=( "$k" )
	done

	write_array "${result[@]}" | sort
}

function get_functions() {
	emulate -L zsh

	write_array "${(k)functions[@]}" | sed '/^_.+/d' | sort
}

function get_variables() {
	emulate -L zsh

	write_array "${(k)parameters[@]}" | sed '/^_.+/d' | sort
}

################################################################################

get_builtins
