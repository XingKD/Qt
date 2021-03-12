import QtQuick 2.14

Item {
    id: myBusyIndicator

    width: 66
    height: 80
    anchors.centerIn: parent
    Item {
        width: parent.width
        height: width
        Canvas {
            id: canvas
            property real spinnerWidth: 8

            property bool autoChangeColor: true

            property color color: "ForestGreen"

            anchors.fill: parent

            renderStrategy: Canvas.Threaded
            antialiasing: true
            onPaint: {
                var ctx = getContext("2d");
                ctx.reset();
                ctx.clearRect(0, 0, width, height);
                ctx.strokeStyle = color
                ctx.lineWidth = spinnerWidth
                ctx.lineCap = "round";

                ctx.translate(width / 2, height / 2);
                ctx.rotate(internal.rotate);

                ctx.arc(0, 0, Math.min(width, height) / 2 - ctx.lineWidth,
                        internal.arcStartPoint,
                        internal.arcEndPoint,
                        false);

                ctx.stroke();
            }

            opacity:  visible ? 1.0 : 0

            Behavior on opacity {
                PropertyAnimation {
                    duration: 800
                }
            }

            Connections {
                target: canvas
                function onColorChanged(){canvas.requestPaint()}
                function onSpinnerWidthChanged(){canvas.requestPaint()}
            }

            QtObject {
                id: internal

                property real arcEndPoint: 0
                onArcEndPointChanged: canvas.requestPaint();

                property real arcStartPoint: 0
                onArcStartPointChanged: canvas.requestPaint();

                property real rotate: 0
                onRotateChanged: canvas.requestPaint();

                property real longDash: 3 / 2 * Math.PI
                property real shortDash: 19 / 10 * Math.PI
            }

            NumberAnimation {
                target: internal
                properties: "rotate"
                from: 0
                to: 2 * Math.PI
                loops: Animation.Infinite
                running: canvas.visible
                easing.type: Easing.Linear
                duration: 3000
            }

            SequentialAnimation {
                running: canvas.visible
                loops: Animation.Infinite

                ParallelAnimation {
                    NumberAnimation {
                        target: internal
                        properties: "arcEndPoint"
                        from: 0
                        to: internal.longDash
                        easing.type: Easing.InOutCubic
                        duration: 800
                    }

                    NumberAnimation {
                        target: internal
                        properties: "arcStartPoint"
                        from: internal.shortDash
                        to: 2 * Math.PI - 0.001
                        easing.type: Easing.InOutCubic
                        duration: 800
                    }
                }

                ParallelAnimation {
                    NumberAnimation {
                        target: internal
                        properties: "arcEndPoint"
                        from: internal.longDash
                        to: 2 * Math.PI - 0.001
                        easing.type: Easing.InOutCubic
                        duration: 800
                    }

                    NumberAnimation {
                        target: internal
                        properties: "arcStartPoint"
                        from: 0
                        to: internal.shortDash
                        easing.type: Easing.InOutCubic
                        duration: 800
                    }
                }
            }
        }
        SequentialAnimation {
            running: canvas.autoChangeColor && canvas.visible
            loops: Animation.Infinite
            ColorAnimation {
                from: "#BB0000"
                to: "SteelBlue"
                target: canvas
                properties: "color"
                easing.type: Easing.InOutQuad
                duration: 1600
            }
            ColorAnimation {
                from: "SteelBlue"
                to: "ForestGreen"
                target: canvas
                properties: "color"
                easing.type: Easing.InOutQuad
                duration: 1600
            }
            ColorAnimation {
                from: "ForestGreen"
                to: "#BB0000"
                target: canvas
                properties: "color"
                easing.type: Easing.InOutQuad
                duration: 1600
            }
        }
    }
}
