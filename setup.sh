#/bin/bash

echo "This script replaces the current bash / irb settings!"

cp `dirname $0`/.bash_profile ~/
cp `dirname $0`/.bashrc ~/
cp `dirname $0`/.git-completion.bash ~/
cp `dirname $0`/.irbrc ~/
cp `dirname $0`/.gemrc ~/
