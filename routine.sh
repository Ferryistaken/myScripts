#!/usr/bin/sh
shutdown="false"

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
echo "    -s | --shutdown -> shut down when done"
}

while [ "$1" != "" ]; do
    case $1 in
        -u | --upgrade )        upgrade
                                ;;
        -s | --shutdown )       shutdown="true"
                                ;;
        -h | --help )           usage
                                exit
                                ;;
        * )                     usage
                                exit 1
    esac
    shift
done

echo -e "\n\033[0;32mCopying files to extra directory\033[0m\n"
cp --no-preserve=mode -r ~/.config/bspwm/ ~/.config/extras/argo/bspwm
cp --no-preserve=mode -r ~/.config/polybar/ ~/.config/extras/argo/polybar

echo -e "\n\033[0;32mSyncing dotfiles\033[0m\n" && yadm pull origin master && yadm stage -u && yadm commit -m "routine commit from `hostname`" && yadm push origin master
echo -e "\n\033[0;35mSyncing scripts\033[0m\n" && (cd $HOME/Documents/scripts;git pull origin master; git stage .; git commit -m "routine push from `hostname`"; git push origin master; cd -)

if [ $shutdown = "true" ];
then
	sleep 15
	shutdown now
fi
