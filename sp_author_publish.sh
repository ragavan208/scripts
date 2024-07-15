#! /bin/bash
echo "Shutting down the author";
../author/crx-quickstart/bin/stop
echo "Author env shut down";
echo "Shutting down the publish";
../publish/crx-quickstart/bin/stop
echo "Publish env shut down";
./show_author_publish_logs.sh
