import QtQuick 2.12
import QtQuick.Controls 2.5
import QtQuick.Layouts 1.3
import Style 1.0

RowLayout {
    spacing: 48 * Style.widthRatio
    property int temp: 72
    property bool airbagOn: false
    Text {
        Layout.alignment: Qt.AlignLeft | Qt.AlignVCenter
        text: "12:00pm"
        font.family: "Inter"
        font.pixelSize: 18 * Style.heightRatio
        font.bold: Font.DemiBold
        color: Style.isDark ? Style.white : Style.black20
    }

    Text {
        Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
        text: "%0ºF".arg(temp)
        font.family: "Inter"
        font.pixelSize: 18 * Style.heightRatio
        font.bold: Font.DemiBold
        color: Style.isDark ? Style.white : Style.black20
    }

    Control {
        Layout.alignment: Qt.AlignRight | Qt.AlignVCenter
        implicitHeight: 52 * Style.heightRatio
        background: Rectangle {
            color: Style.isDark ? Style.alphaColor(Style.black,0.55) : Style.black20
            radius: 7 * Style.heightRatio
        }
        contentItem: RowLayout {
            spacing: 10 * Style.widthRatio
            anchors.centerIn: parent
            Image {
                Layout.alignment: Qt.AlignLeft | Qt.AlignVCenter
                Layout.leftMargin: 10 * Style.widthRatio
                source: "qrc:/icons/top_header_icons/airbag_.svg"
                scale: 1 * Style.heightRatio
            }
            Text {
                Layout.alignment: Qt.AlignRight | Qt.AlignVCenter
                Layout.rightMargin: 10 * Style.widthRatio
                text: airbagOn ? "PASSENGER\nAIRBAG ON" : "PASSENGER\nAIRBAG OFF"
                font.family: Style.fontFamily
                font.bold: Font.Bold
                font.pixelSize: 12 * Style.heightRatio
                color: Style.white
            }
        }
    }
}
