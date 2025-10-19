import QtQuick 2.12
import QtQuick.Controls 2.5
import QtQuick.Layouts 1.3
import Style 1.0

RowLayout {
    spacing: 32 * Style.widthRatio

    Icon {
        Layout.alignment: Qt.AlignLeft | Qt.AlignVCenter
        icon.source: Style.getNavigationIconBasedOnTheme()
        onClicked: Style.mapAreaVisible = ! Style.mapAreaVisible
        scale: 0.35 + 0.5 * Style.heightRatio
    }

    RowLayout {
        Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
        spacing: 15 * Style.widthRatio
        Image {
            Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
            sourceSize: Qt.size(42 * Style.widthRatio, 42 * Style.heightRatio)
            source: Style.getUserIconBasedOnTheme()
        }
        Text {
            Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
            font.pixelSize: 18 * Style.heightRatio
            font.bold: Font.DemiBold
            font.family: "Inter"
            color: Style.isDark ? Style.white : Style.black20
            text: qsTr("Easy Entry")
        }
    }

    Icon {
        Layout.alignment: Qt.AlignRight | Qt.AlignVCenter
        scale: 0.4 + 0.6 * Style.heightRatio
        icon.source: Style.getSentryIconBasedOnTheme()
        onClicked: Style.isDark  = !Style.isDark
    }
}
