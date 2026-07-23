# YTSEARCH ALIASES

typeset -A _yts_mods=(
  yt   ""
  ytv  "-v"
  ytl  "-l"
  ytlv "-v -l"
  ytvl "-v -l"
)

for _mod _flags in "${(kv)_yts_mods[@]}"; do
  for _suf in s search; do
    _name="$_mod$_suf"
    [[ "$_name" == "ytsearch" ]] && continue
    alias "$_name"="ytsearch $_flags"
  done
done
unset _mod _flags _suf _name _yts_mods
