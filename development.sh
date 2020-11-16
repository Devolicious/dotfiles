function pr() {
    cd ~/projects/$1
}

#function _prcomplete()
#{
#  local cmd curb cur opts
#
#  # base dir
#  git=~/projects/
#
#  # last arg so far
#  cur="${COMP_WORDS[COMP_CWORD]}"
#
#  # dirname-esque, but makes "xyz/" => "xyz/" not "."
#  curb=$(echo $cur | sed 's,[^/]*$,,')
#
#  # get list of directories (use commened out line for dirs and files)
#  # append '/' to directories
#  #cmd="find $git$curb -maxdepth 1 -type d -printf %p/\n , -type f -print "
#  #cmd=`find $git$curb -maxdepth 1 -type d -printf "%p/\n"`
#  cmd=`find $git -name "$curb*" -maxdepth 1 -type d`
#
#  # remove base dir from list and remove extra trailing /s
#  opts=$($cmd | sed s:$git:: | sed s://*$:/:)
#
#  # generate list of completions
#  COMPREPLY=( $(compgen -W "${opts}" -- ${cur}) )
#  return 0;
#}
#complete -o nospace -F _prcomplete pr


function pw {
    # Register the command you want to run when changes are detected here
    run="clear && printf '\e[3J' && vendor/bin/phpunit"

    # Retrieve the custom argments. If none are provided, default to ""
    [[ -n $@ ]] && args=$@ || args=""

    # Run the command first...
    eval "$run $args"
    # ...then start watching for changes—and run on change
    watchman-make \
        -p 'src/**/*.php' 'tests/**/*.php' \
        --make=$run \
        -t "$args"
}