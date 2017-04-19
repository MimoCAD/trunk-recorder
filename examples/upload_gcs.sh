#!/usr/bin/env bash
#
# Uploads trunk-recorder files to Google cloud storage bucket
#
# Assumes you have already installed and configured gsutil
# See <https://cloud.google.com/storage/docs/gsutil>
#
# Must have execute permission ('chmod +x unload_gcs.sh') and
# be located in the same directory as the trunk-recorder
# executable.
#
# Configure GSUTIL and BUCKET to your environment
#
GSUTIL="/usr/bin/gsutil"
BUCKET="p25-player-audio"   # add path to BUCKET as needed (e.g. "bucket-name/subdir/")
#
DELAY="2s"
FILENAME="$1"
echo "Uploading: ${FILENAME}"
BASENAME="${FILENAME%.*}"
JSON="${BASENAME}.json"
sleep ${DELAY}
${GSUTIL} cp ${FILENAME} ${JSON} gs://${BUCKET}
if [ $? -eq 0 ]
then
    echo "Uploaded ${FILENAME}"
else
    echo "Failed to upload ${FILENAME}"
    exit 1
fi
