#!/bin/bash
CURRENT_DIR=`pwd`
RES=608
YOLO_NAME="yolov4_"$RES"_b2"
YOLO_CFG=$YOLO_NAME"_CFG"
YOLO_WEIGHTS=$YOLO_NAME"_WEIGHTS"
YOLO_CFG_VAL=`printenv $YOLO_CFG`
YOLO_WEIGHTS_VAL=`printenv $YOLO_WEIGHTS`

cd $CURRENT_DIR/native
mkdir $YOLO_NAME

cp config_infer_primary.txt deepstream_app_config.txt ./$YOLO_NAME

cfg_replace="s#yolo.cfg#$YOLO_CFG_VAL#g"
weights_replace="s#yolo.weights#$YOLO_WEIGHTS_VAL#g"
lib_replace="s#nvdsinfer_custom_impl_Yolo/#../nvdsinfer_custom_impl_Yolo/#g"
class_replace="s#=80#=2#g"
mode_replace="s#network-mode=0#network-mode=2#g"

cd $YOLO_NAME

sed -i $cfg_replace config_infer_primary.txt
sed -i $weights_replace config_infer_primary.txt
sed -i $lib_replace config_infer_primary.txt
sed -i $class_replace config_infer_primary.txt
sed -i $mode_replace config_infer_primary.txt