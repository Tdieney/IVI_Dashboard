import QtQuick 2.12
import QtQuick.Controls 2.5
import QtQuick.Layouts 1.3
import Style 1.0

import "qrc:/LayoutManager.js" as Responsive

RowLayout {
    property var adaptive: new Responsive.AdaptiveLayoutManager(1920 , 54, parent.width, parent.height)

    Component.onCompleted: {
        console.log("height:", parent.height)
        console.log("width:", parent.width)
        console.log("height ratio:", adaptive.getHeightRatio())
        console.log("width ratio:", adaptive.getWidthRatio())
    }
    spacing: 48 * adaptive.getWidthRatio()
    property int temp: 72
    property bool airbagOn: false
    Text {
        Layout.alignment: Qt.AlignLeft | Qt.AlignVCenter
        text: "12:00pm"
        font.family: "Inter"
        font.pixelSize: 18
        font.bold: Font.DemiBold
        color: Style.isDark ? Style.white : Style.black20
    }

    Text {
        Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
        text: "%0ºF".arg(temp)
        font.family: "Inter"
        font.pixelSize: 18 * adaptive.getHeightRatio()
        font.bold: Font.DemiBold
        color: Style.isDark ? Style.white : Style.black20
    }

    Control {
        Layout.alignment: Qt.AlignRight | Qt.AlignVCenter
        implicitHeight: 38 * adaptive.getHeightRatio()
        background: Rectangle {
            color: Style.isDark ? Style.alphaColor(Style.black,0.55) : Style.black20
            radius: 7 * adaptive.getHeightRatio()
        }
        contentItem: RowLayout {
            spacing: 10 * adaptive.getWidthRatio()
            anchors.centerIn: parent
            Image {
                Layout.alignment: Qt.AlignLeft | Qt.AlignVCenter
                Layout.leftMargin: 10 * adaptive.getWidthRatio()
                source: "qrc:/icons/top_header_icons/airbag_.svg"
            }
            Text {
                Layout.alignment: Qt.AlignRight | Qt.AlignVCenter
                Layout.rightMargin: 10 * adaptive.getWidthRatio()
                text: airbagOn ? "PASSENGER\nAIRBAG ON" : "PASSENGER\nAIRBAG OFF"
                font.family: Style.fontFamily
                font.bold: Font.Bold
                font.pixelSize: 12 * adaptive.getHeightRatio()
                color: Style.white
            }
        }
    }
}
