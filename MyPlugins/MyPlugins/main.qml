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
    flags: Qt.FramelessWindowHint
    color: "transparent"
    Item {
        width: parent.width - windowRadius * 2
        height: parent.height - windowRadius * 2
        anchors.centerIn: parent
        Rectangle {
            id: backgroundRect
            anchors.fill: parent
            radius: windowRadius
            color: "#DDDDDD"
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
