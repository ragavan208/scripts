#! /bin/bash
echo "shutting down the author";
../author/crx-quickstart/bin/stop
echo "Author env shut down";
echo "shutting down the publish";
../publish/crx-quickstart/bin/stop
echo "Publish env shut down";
