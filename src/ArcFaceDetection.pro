QT += core gui widgets

CONFIG += c++11

TARGET = demo
TEMPLATE = app

HEADERS += \
	ArcFaceDetection/ArcFaceDetection.h \
	ArcFaceDetection/FaceEngine.h \
	ArcFaceDetection/resource.h \
	ArcFaceDetection/Utils.h \
	ArcFaceDetection/config.h \
	ArcFaceDetection/IrPreviewDialog.h \
	ArcFaceDetection/UiStyle.h

SOURCES += \
	ArcFaceDetection/ArcFaceDetection.cpp \
	ArcFaceDetection/FaceEngine.cpp \
	ArcFaceDetection/IrPreviewDialog.cpp \
        ArcFaceDetection/main.cpp \
        ArcFaceDetection/Utils.cpp

FORMS += \
    ArcFaceDetection/ArcFaceDetection.ui

INCLUDEPATH += <ArcFace SDK 的目录>/inc
INCLUDEPATH += <OpenCV 的目录>/include

LIBS += "-L<ArcFace SDK 的目录>/lib/linux_x64" \
    -larcsoft_face_engine \
    -larcsoft_face

LIBS += "-L<OpenCV 的目录>/lib" \
    -lopencv_imgcodecs \
    -lopencv_imgproc \
    -lopencv_core \
    -lopencv_videoio

$QMAKE_CXXFLAGS += pkg-config opencv --libs --cflags opencv

RESOURCES += \
    ArcFaceDetection/resources.qrc

# Default rules for deployment.
qnx: target.path = /tmp/$${TARGET}/bin
else: unix:!android: target.path = /opt/$${TARGET}/bin
!isEmpty(target.path): INSTALLS += target
