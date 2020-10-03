#!/usr/bin/sh

upgrade() {
echo -e "\n\033[0;37mStarting full system upgrade\033[0m\n"

$HOME/Documents/scripts/fullUpgrade.sh
}

usage() {
echo "This is a script to automate routine tasks."
echo "By default, it just pushes dotfiles to master"
echo "Flags:"
echo "    -u | --upgrade -> also do a full system upgrade"
echo "    -h | --help -> show this message"
}

while [ "$1" != "" ]; do
    case $1 in
        -u | --upgrade )        upgrade
                                ;;
        -h | --help )           usage
                                exit
                                ;;
        * )                     usage
                                exit 1
    esac
    shift
done


echo -e "\n\033[0;32mPushing dotfile changes\033[0m\n" && yadm stage -u && yadm commit -m "routine commit" && yadm push origin master
echo -e "\n\033[0;32mPushing script changes\033[0m\n" && (cd $HOME/Documents/scripts; git stage .; git commit -m "routine push"; git push origin master; cd -)
