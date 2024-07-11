#! /bin/bash
echo "Bringing the author env up";
../author/crx-quickstart/bin/start
echo "Author env will be up in 2 minutes";
echo "Bringing the publish env up";
../publish/crx-quickstart/bin/start
echo "Publish env will be up in 2 minutes";
