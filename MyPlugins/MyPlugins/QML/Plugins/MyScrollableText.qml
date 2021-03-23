//--------------------------------------------------------------//
//  File : ScrollableText.qml                                   //
//  Copyright(c),Shenzhen FYTX Tech Co.,Ltd.                    //
//  All rights reserved                                         //
//                                                              //
//  Change Logs:                                                //
//  Date        Author        Notes                             //
//  2021.03.23  XingKD        Create this file                  //
//--------------------------------------------------------------//
import QtQuick 2.14

//--------------------------------------------------------------
// 页面 : 可滚动文本
// 参数 : isScrolling: 滚动开关
//       text: text对象
//       scrollRate: 滚动速度(单位:毫秒)
//--------------------------------------------------------------
Item {
    id: scrollableText

    property bool isScrolling: mouseArea.containsMouse
    property alias text: contentText
    property int scrollRate: (contentText.implicitWidth - width) / contentText.font.pixelSize * 200

    clip: true
    Text {
        id: contentText
        width: implicitWidth
        height: parent.height
        verticalAlignment: Text.AlignVCenter
        font.pixelSize: height / 2
        SequentialAnimation {
            id: scrollAnimation
            loops: -1
            running: isScrolling && (contentText.width > scrollableText.width)
            PropertyAnimation {
                target: contentText
                property: "x"
                from: 0
                to: 0
                duration: 1000
            }
            PropertyAnimation {
                target: contentText
                property: "x"
                from: 0
                to: (scrollableText.width - contentText.width)
                duration: scrollRate >= 0 ? scrollRate : 0
            }
            PropertyAnimation {
                duration: 1000
            }
            onStopped: {
                contentText.x = 0;
            }
        }
    }
    MouseArea {
        id: mouseArea
        anchors.fill: parent
        hoverEnabled: true
    }
}

// Example :
//
//    Plugins.MyScrollableText {
//        width: parent.width / 5
//        height: 30
//        anchors.centerIn: parent
//        text.text: qsTr("阿萨德洛克故居；独立思考过啊建档立卡感觉了多少；个")
//        text.color: 'white'
//    }
//
//


