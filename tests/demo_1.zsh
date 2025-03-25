local x = "My home is ${HOME}."

local y = "My user ID is $(id -u)."

local z = "My favorite number is $(( sqrt(4761) ))."

local heredoc = $(cat << EOF
${FOO} this is a heredoc-text
EOF
)

local no_escapes  =  'foo\nbar'
local yes_escapes = $'foo\nbar'
