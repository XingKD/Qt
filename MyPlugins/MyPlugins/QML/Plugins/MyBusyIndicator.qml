//--------------------------------------------------------------//
//  File : MyBusyIndicator.qml                                  //
//  Copyright(c),Shenzhen FYTX Tech Co.,Ltd.                    //
//  All rights reserved                                         //
//                                                              //
//  Change Logs:                                                //
//  Date        Author        Notes                             //
//  2021.03.12  XingKD        Create this file                  //
//--------------------------------------------------------------//
import QtQuick 2.14

//--------------------------------------------------------------
// 零件 ：等待指示器
// 参数 ：lineWidth: 指示器线条宽度
//       strokeColor: 指示器颜色（禁用自动变色时有效）
//       isAutoChangeColor:  自动变色选项
//       busyText: 指示器文本
//       textColor: 指示器文本颜色
//--------------------------------------------------------------
Item {
    id: myBusyIndicator

    property int lineWidth: 6
    property color strokeColor: "silver"
    property bool isAutoChangeColor: false
    property string busyText
    property color textColor: strokeColor

    property real startAngle
    property real endAngle
    property real rotateAngle: 0


    onStartAngleChanged: {
        canvas.requestPaint();
    }
    onEndAngleChanged: {
        canvas.requestPaint();
    }
    onRotateAngleChanged: {
        canvas.requestPaint();
    }
    onStrokeColorChanged: {
        canvas.requestPaint();
    }

    width: 60
    height: 80
    anchors.centerIn: parent

    // 自动变色动画
    SequentialAnimation {
        running: myBusyIndicator.enabled && isAutoChangeColor
        loops: Animation.Infinite
        ColorAnimation {
            target: myBusyIndicator
            property: "strokeColor"
            from: "DarkRed"
            to: "Green"
            duration: 3000
        }
        ColorAnimation {
            target: myBusyIndicator
            property: "strokeColor"
            from: "Green"
            to: "Blue"
            duration: 3000
        }
        ColorAnimation {
            target: myBusyIndicator
            property: "strokeColor"
            from: "Blue"
            to: "DarkRed"
            duration: 3000
        }
    }
    // 弧长度切换动画
    SequentialAnimation{
        running: myBusyIndicator.enabled
        loops: Animation.Infinite
        ParallelAnimation {
            NumberAnimation {
                target: myBusyIndicator
                property: "startAngle"
                from: 0
                to: 3 / 2 * Math.PI
                duration: 2000
                easing.type: Easing.InOutCubic
            }
            NumberAnimation {
                target: myBusyIndicator
                property: "endAngle"
                from: 3 / 2 * Math.PI
                to: 2 * Math.PI
                duration: 2000
                easing.type: Easing.InOutCubic
            }
        }
        ParallelAnimation {
            NumberAnimation {
                target: myBusyIndicator
                property: "startAngle"
                from: 3 / 2 * Math.PI
                to: 2 * Math.PI
                duration: 1000
                easing.type: Easing.InOutCubic
            }
            NumberAnimation {
                target: myBusyIndicator
                property: "endAngle"
                from: 0
                to: 3 / 2 * Math.PI
                duration: 1000
                easing.type: Easing.InOutCubic
            }
        }
    }
    // 整体旋转动画
    NumberAnimation {
        target: myBusyIndicator
        running: myBusyIndicator.enabled
        loops: Animation.Infinite
        property: "rotateAngle"
        from: 0
        to: 2 * Math.PI
        duration: 2500
    }

    Column {
        anchors.fill: parent
        Item {
            width: parent.width
            height: parent.height * 2 / 3
            Canvas {
                id: canvas
                anchors.fill: parent
                onPaint: {
                    var ctx = getContext("2d");
                    ctx.reset();
                    ctx.strokeStyle = strokeColor;
                    ctx.lineWidth = lineWidth;
                    ctx.lineCap = "round";
                    ctx.translate(width/2, height/2);
                    ctx.rotate(rotateAngle);
                    ctx.arc(0, 0, Math.min(width, height)/2-lineWidth, startAngle, endAngle, false);
                    ctx.stroke();
                }
            }
        }
        Text {
            width: parent.width
            height: parent.height / 3
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            font.family: "Microsoft Yahei"
            font.pixelSize: height / 2
            color: textColor
            text: busyText
        }
    }
}


// Example :
//
//    Plugins.MyBusyIndicator {
//        id: my
//        busyText: qsTr("加载中")
//        isAutoChangeColor: true
//        Timer {
//            property int triggerCount: 0
//            interval: 1000
//            running: true
//            repeat: true
//            onTriggered: {
//                switch(triggerCount++%3) {
//                    case 0: my.busyText = qsTr("加载中") + " ."; break;
//                    case 1: my.busyText = qsTr("加载中") + " . ."; break;
//                    case 2: my.busyText = qsTr("加载中") + " . . ."; break;
//                }
//            }
//        }
//    }
//
//

