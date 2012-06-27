PROJECT_NAME=example
PROJECT_ROOT=$(shell pwd)
AVD_NAME="android23" #The avd name

run-iphone:
	@DEVICE_TYPE=iphone make run

test-iphone:
	@DEVICE_TYPE=iphone make test

run-ipad:
	@DEVICE_TYPE=ipad make run

test-ipad:
	@DEVICE_TYPE=ipad make test

run-android:
	@DEVICE_TYPE=android make run

test-android:
	@DEVICE_TYPE=android make test

run:
	@if [ "${DEVICE_TYPE}" == "" ]; then\
		echo "Please run \"make run-[iphone|ipad]\" instead.";\
		exit 1;\
	fi
	@make launch-titanium

test:
	@if [ "${DEVICE_TYPE}" == "" ]; then\
		echo "Please run \"make test-[iphone|ipad]\" instead.";\
		exit 1;\
	fi
	@make launch-titanium

clean:
	@rm -rf ${PROJECT_ROOT}/${PROJECT_NAME}/build/iphone/*
	@mkdir -p ${PROJECT_ROOT}/${PROJECT_NAME}/build/iphone/
	@echo "Deleted: ${PROJECT_ROOT}/${PROJECT_NAME}/build/iphone/*"

launch-titanium:
	@echo "Building with Titanium... (DEVICE_TYPE:${DEVICE_TYPE})"
	@mkdir -p ${PROJECT_ROOT}/${PROJECT_NAME}/build/iphone/
	@PROJECT_NAME=${PROJECT_NAME} PROJECT_ROOT=${PROJECT_ROOT} DEVICE_TYPE=${DEVICE_TYPE} bash ${PROJECT_ROOT}/titanium.sh
