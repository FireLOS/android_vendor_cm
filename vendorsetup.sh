echo "_________________________________________________________________________________________________________________________"
echo "|                                                                                                                       |"
echo "|    ###########     ######      ##############       ##########            ##            ##########        ######      |"
echo "|    ##                ##        ##           ##      ##                    ##           ##        ##     ##            |"
echo "|    ##                ##        ##            ##     ##                    ##           ##        ##    ##             |"
echo "|    ###########       ##        ##            ##     ##########            ##           ##        ##     ##            |"
echo "|    ##                ##        ##############       ##                    ##           ##        ##      #########    |"
echo "|    ##                ##        ##           ##      ##                    ##           ##        ##              ##   |"
echo "|    ##                ##        ##            ##     ##                    ##           ##        ##              ##   |"
echo "|    ##              ######      ##             ##    ##########            #########     ##########       #########    |"
echo "|_______________________________________________________________________________________________________________________|"
echo ""
echo " BY ANDROID2468"
echo ""
echo "setting jack server to 4G"
export ANDROID_JACK_VM_ARGS="-Dfile.encoding=UTF-8 -XX:+TieredCompilation -Xmx4G"
echo ""

# offical builds
buildType="${1}"
if [ "${buildType}" = "android" ];
then
    echo "You have entered the secret word! You are offical!!"
    echo "setting BUILDTYPE to RELEASE..."
    export CM_BUILDTYPE=RELEASE
fi

# cchache stuff
echo "clearing cchache..."
prebuilts/misc/linux-x86/ccache/ccache -C

echo "enableing ccache"
export USE_CCACHE=1
prebuilts/misc/linux-x86/ccache/ccache -M 50G


for combo in $(curl -s https://raw.githubusercontent.com/LineageOS/hudson/master/lineage-build-targets | sed -e 's/#.*$//' | grep cm-14.1 | awk '{printf "lineage_%s-%s\n", $1, $2}')
do
    add_lunch_combo $combo
done

export "NOTE if you get an error with flex run  ' export LC_ALL=C ' in terminal."
