#!/usr/bin/env zsh
setopt no_unset err_exit pipe_fail

local script_path=$(realpath -- "$0")
local script_dir=$(dirname -- "$script_path")

local src_dir="${script_dir}/src"

ln --symbolic -- \
	"$(realpath --relative-base="$src_dir" -- "${src_dir}/zsh.yaml")" \
	"${XDG_CONFIG_HOME:-$HOME/.config}"
