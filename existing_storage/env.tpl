#!/bin/bash -xe
export RAMDISK=/tmp/ramdisk
export DOCKERMOUNT=/var/lib/docker
# export USERMGTIMAGE=powerai-vision-usermgt:${vision_version}
export AWS_ACCESS_KEY_ID=${cos_access_key}
export AWS_SECRET_ACCESS_KEY=${cos_secret_access_key}
export COS_BUCKET_BASE=${cos_bucket_base}
# export URLPAIVIMAGES="$${COS_BUCKET_BASE}/${vision_tar_name}"
# export URLPAIVDEB="$${COS_BUCKET_BASE}/${vision_deb_name}"
export ACCESS_KEY_ID=${hmac_access_key}
export SECRET_ACCESS_KEY=${hmac_secret_key}
export BUCKET_NAME=${bucket_name}
export PUBLIC_ENDPOINT=${public_endpoint}
