#!/usr/bin/env zsh
setopt no_unset err_exit pipe_fail

local script_path=$(realpath --physical "$0")
local script_dir=$(dirname -- "$script_path")

local repo_root_dir=$(realpath -- "${script_dir}/..")

local source_path=$(
	realpath --relative-base="$repo_root_dir" -- "${repo_root_dir}/zsh.yaml"
)

local destination_path="${XDG_CONFIG_HOME:-$HOME/.config}/zsh.yaml"

ln --symbolic -- "$source_path" "$destination_path"
