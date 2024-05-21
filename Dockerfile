# Use the kit 105.1.2 streaming base image available publicly via NVIDIA NGC
FROM nvcr.io/nvidia/omniverse/ov-kit-appstreaming:105.1.2-135279.16b4b239

ARG FAT_PACK
ARG OVC_KIT

RUN if [  -z $FAT_PACK ];then \
  >&2 echo  "\n****************Warning!!!!*************\n"; \
  >&2 echo "Define docker build --build-arg FAT_PACK=<path_to_your_fat_package>.zip, it cannot be empty!" ; false;\
  fi

RUN if [  -z $OVC_KIT ];then \
  >&2 echo  "\n****************Warning!!!!*************\n"; \
  >&2 echo "Define docker build --build-arg OVC_KIT=<some.file.ovc.kit>, it cannot be empty!" ; false;\
  fi

ENV OVC_KIT=$OVC_KIT

# /opt/nvidia/omniverse/protein-folding

# Cleanup embedded kit-sdk-launcher package as usd-viewer is a full package with kit-sdk
RUN rm -rf /opt/nvidia/omniverse/kit-sdk-launcher

# Copy the usd-viewer application package from the _build/packages directory into the containers /opt/nvidia/omniverse/protein-folding directory.
COPY --chown=ubuntu:ubuntu $FAT_PACK /opt/nvidia/omniverse/protein-folding/

# Unzip the application package into the container's /opt/nvidia/omniverse/protein-folding directory and then delete the application package
WORKDIR /opt/nvidia/omniverse/protein-folding
RUN FAT_PACK_BASE=$(basename $FAT_PACK) && unzip $FAT_PACK_BASE -d . && rm $FAT_PACK_BASE

# Pull in any additional required dependencies
RUN /opt/nvidia/omniverse/protein-folding/pull_kit_sdk.sh

# Copy in the Forklift data if available. This should be uncommented if embedding the sample data into the container image.
#COPY --chown=ubuntu:ubuntu data/ /opt/nvidia/omniverse/protein-folding/data

# Copy the user defined ovc kit file from the repos source/apps directory into the container image.
#COPY --chown=ubuntu:ubuntu source/apps/$OVC_KIT /app/apps/$OVC_KIT

# Copy the startup.sh script from the repos source/scripts directory.
# This is what will be called when the container image is started.
COPY --chown=ubuntu:ubuntu startup.sh /startup.sh
RUN chmod +x /startup.sh

# This specifies the container's default entrypoint that will be called by "> docker run".
ENTRYPOINT [ "/startup.sh" ]

