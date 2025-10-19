import QtQuick 2.12
import QtQuick.Controls 2.5
import QtQuick.Layouts 1.3
import Style 1.0

import "qrc:/LayoutManager.js" as Responsive

RowLayout {
    spacing: 32 * adaptive.getWidthRatio()

    property var adaptive: new Responsive.AdaptiveLayoutManager(1920 , 54, parent.width, parent.height)

    // Component.onCompleted: {
    //     console.log("height:", parent.height)
    //     console.log("width:", parent.width)
    //     console.log("height ratio:", adaptive.getHeightRatio())
    //     console.log("width ratio:", adaptive.getWidthRatio())
    // }

    Icon {
        Layout.alignment: Qt.AlignLeft | Qt.AlignVCenter
        icon.source: Style.getNavigationIconBasedOnTheme()
        onClicked: Style.mapAreaVisible = ! Style.mapAreaVisible
        scale: 0.35 + 0.5 * adaptive.getHeightRatio()
    }

    RowLayout {
        Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
        spacing: 15 * adaptive.getWidthRatio()
        Image {
            Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
            sourceSize: Qt.size(42 * adaptive.getWidthRatio(), 42 * adaptive.getHeightRatio())
            source: Style.getUserIconBasedOnTheme()
        }
        Text {
            Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
            font.pixelSize: 18 * adaptive.getHeightRatio()
            font.bold: Font.DemiBold
            font.family: "Inter"
            color: Style.isDark ? Style.white : Style.black20
            text: qsTr("Easy Entry")
        }
    }

    Icon {
        Layout.alignment: Qt.AlignRight | Qt.AlignVCenter
        scale: 0.4 + 0.6 * adaptive.getHeightRatio()
        icon.source: Style.getSentryIconBasedOnTheme()
        onClicked: Style.isDark  = !Style.isDark
    }
}
