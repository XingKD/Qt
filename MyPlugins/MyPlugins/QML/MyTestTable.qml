import QtQuick 2.14

import "./Plugins" as Plugins


Item {
    id: myTestTable

    anchors.fill: parent

    Plugins.MyBusyIndicator {
        id: my
        busyText: qsTr("加载中")
        isAutoChangeColor: true
        Timer {
            property int triggerCount: 0
            interval: 1000
            running: true
            repeat: true
            onTriggered: {
                switch(triggerCount++%3) {
                    case 0: my.busyText = qsTr("加载中") + " ."; break;
                    case 1: my.busyText = qsTr("加载中") + " . ."; break;
                    case 2: my.busyText = qsTr("加载中") + " . . ."; break;
                }
            }
        }
    }
}
