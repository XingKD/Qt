//--------------------------------------------------------------//
//  File : MySwitch.qml                                         //
//  Copyright(c),Shenzhen FYTX Tech Co.,Ltd.                    //
//  All rights reserved                                         //
//                                                              //
//  Change Logs:                                                //
//  Date        Author        Notes                             //
//  2021.03.23  XingKD        Create this file                  //
//--------------------------------------------------------------//
import QtQuick 2.14
import QtQuick.Controls 2.14
import QtGraphicalEffects 1.0

//--------------------------------------------------------------
// 零件 : 开关
// 参数 : None
//--------------------------------------------------------------
Switch {
    id: mySwitch

    width: 50
    height: 25
    anchors.centerIn: parent
    indicator: Rectangle {
        anchors.fill: parent
        radius: height / 2
        border.color: "#BDC8D8"
        border.width: height / 10
        color: mySwitch.checked ? "green" : "white"
        Behavior on color {ColorAnimation {duration: 150}}
        Rectangle {
            id: checkButton1
            width: mySwitch.hovered ? height + 5 * dpi : height
            Behavior on width {PropertyAnimation {duration: 150}}
            height: parent.height * 4 / 5
            radius: height / 2
            anchors.top: parent.top
            anchors.topMargin: parent.height / 10
            anchors.right: parent.right
            anchors.rightMargin: parent.height / 10
            layer.enabled: true
            layer.effect: DropShadow {}
            states: [
                State {
                    name: "checked"
                    PropertyChanges {
                        target: checkButton1
                        anchors.rightMargin: mySwitch.height / 10
                    }
                    when: mySwitch.checked
                },
                State {
                    name: "unchecked"
                    PropertyChanges {
                        target: checkButton1
                        anchors.rightMargin: mySwitch.width - checkButton1.width - mySwitch.height / 10
                    }
                    when: !mySwitch.checked
                }
            ]
            transitions: Transition {
                PropertyAnimation {
                    properties: "anchors.rightMargin"
                    duration: 150
                }
            }
        }
    }
    MouseArea {
        anchors.fill: parent
        enabled: false
        cursorShape: parent.hovered ? Qt.PointingHandCursor : Qt.ArrowCursor
    }
}

// Example :
//
//    Plugins.MySwitch {}
//

