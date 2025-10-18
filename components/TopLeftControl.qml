import QtQuick 2.12
import QtQuick.Controls 2.5
import QtQuick.Layouts 1.3
import Style 1.0

import "qrc:/LayoutManager.js" as Responsive

RowLayout {
    id: root
    property int index: 0
    property int batteryPercentage: 90
    spacing: 51 * adaptive.getWidthRatio()

    property var adaptive: new Responsive.AdaptiveLayoutManager(1920 , 54, parent.width, parent.height)

    // Component.onCompleted: {
    //     console.log("height:", parent.height)
    //     console.log("width:", parent.width)
    // }

    RowLayout {
        Layout.alignment: Qt.AlignLeft | Qt.AlignVCenter
        spacing: 4 * adaptive.getWidthRatio()
        Text {
            Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
            property bool current: root.index === 0
            color: current ? Style.isDark ? Style.white : "#171717" : Style.black20
            text: "P"
            font.family: "Inter"
            font.bold: Font.Bold
            font.pixelSize: 18 * adaptive.getHeightRatio()
        }
        Text {
            Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
            property bool current: root.index === 1
            color: current ? "#171717" : Style.black20
            text: "R"
            font.family: "Inter"
            font.bold: Font.Bold
            font.pixelSize: 18 * adaptive.getHeightRatio()
        }
        Text {
            Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
            property bool current: root.index === 2
            color: current ? "#171717" : Style.black20
            text: "N"
            font.family: "Inter"
            font.bold: Font.Bold
            font.pixelSize: 18 * adaptive.getHeightRatio()
        }
        Text {
            Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
            property bool current: root.index === 3
            color: current ? "#171717" : Style.black20
            text: "D"
            font.family: "Inter"
            font.bold: Font.Bold
            font.pixelSize: 18 * adaptive.getHeightRatio()
        }
    }

    RowLayout {
        Layout.alignment: Qt.AlignRight | Qt.AlignVCenter
        spacing: 0
        Image {
            Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
            source: "qrc:/icons/top_header_icons/battery.svg"
            width: Style.iconSizeLarge  // Fixed 32px
            height: Style.iconSizeLarge // Fixed 32px
            fillMode: Image.PreserveAspectFit
        }
        Text {
            Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
            color: Style.isDark ? Style.white : Style.black10
            text: qsTr("%0%").arg(batteryPercentage)
            font.family: "Inter"
            font.bold: Font.Bold
            font.pixelSize: 18 * adaptive.getHeightRatio()
        }
    }
}
