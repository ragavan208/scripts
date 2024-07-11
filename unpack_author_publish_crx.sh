#! /bin/bash
echo "Deleting the author & publish crx-quickstart if any available";
./delete_author_publish_crx.sh
echo "Unpacking the author  crx-quickstart";
cd ../author
java -jar *.jar -unpack
echo "Unpacked the author crx-quickstart";
echo "Unpacking the publish crx-quickstart";
cd ../publish
java -jar *.jar -unpack
echo "Unpacked the publish crx-quickstart";
../scripts/copy_start_scripts_to_author_publish.sh
