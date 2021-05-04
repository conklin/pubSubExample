#!/bin/sh

BUCKET_URL=`gsutil ls gs:// | grep pub-sub-example-tf-state`
if [[ $BUCKET_URL == '' ]] ; then
    UNIQUE_NAME_POST_FIX=`uuidgen |  cut -f5 -d'-'  | tr '[:upper:]' '[:lower:]'`
    gsutil mb gs://pub-sub-example-tf-state-${UNIQUE_NAME_POST_FIX}
    BUCKET_URL=`gsutil ls gs:// | grep pub-sub-example-tf-state`
fi

regex='\/\/(.*)\/'
[[ $BUCKET_URL =~ $regex ]]
BUCKET_NAME=${BASH_REMATCH[1]}

cat > backend.tf <<EOF
terraform {
  backend "gcs" {
    prefix  = "terraform/state"
    bucket  = "$BUCKET_NAME"
  }
}
EOF