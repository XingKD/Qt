import QtQuick 2.12
import QtQuick.Window 2.12
import QtGraphicalEffects 1.0

import "./QML" as QML

Window {
    id: mainWindow

    property int windowRadius: 5

    visible: true
    width: 640
    height: 480
    title: qsTr("Hello World")
    flags: Qt.FramelessWindowHint | Qt.Window
    color: "transparent"
    Item {
        width: parent.width - windowRadius * 2
        height: parent.height - windowRadius * 2
        anchors.centerIn: parent
        Rectangle {
            id: backgroundRect
            anchors.fill: parent
            radius: windowRadius
//            color: "#2B3133"
            gradient: Gradient {
                GradientStop {position: 0; color: "slategray"}
                GradientStop {position: 1; color: "slategray"}
            }
        }
        DropShadow {
            anchors.fill: backgroundRect
            radius: windowRadius
            samples: windowRadius * 2 + 1
            source: backgroundRect
        }
        QML.MyTestTable {}
    }
}
