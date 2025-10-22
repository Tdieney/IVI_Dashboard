import QtQuick 2.12
import QtQuick.Controls 2.5
import QtQuick.Layouts 1.3
import QtGraphicalEffects 1.12
import Style 1.0

Rectangle {
    height: parent.height
    width: parent.width / 4
    x: 0
    y: 0
    color: Style.isDark ? Style.gptDarkSideBar : Style.gptLightSideBar

    Rectangle {
        id: titleRect
        width: 80 * Style.widthRatio
        height: 80 * Style.widthRatio
        x: 50 * Style.widthRatio
        y: 86 * Style.heightRatio
        color: "transparent"

        Image {
            anchors.fill: parent
            source: "qrc:/icons/settings/EAE_FOTA_Logo.png"
            fillMode: Image.PreserveAspectFit
        }
    }

    Rectangle {
        id: titleText
        width: parent.width / 1.7
        height: 80 * Style.widthRatio
        x: 170 * Style.widthRatio
        y: 86 * Style.heightRatio
        color: "transparent"

        Text {
            anchors.fill: parent
            horizontalAlignment: Text.AlignLeft
            verticalAlignment: Text.AlignVCenter
            text: "MS/EAE-XC"
            font.family: Style.fontFamily
            font.pixelSize: 32 * Style.heightRatio
            font.bold: true
            color: Style.isDark ? Style.white : Style.black
        }
    }

    // Line
    Rectangle {
        width: parent.width - 100 * Style.widthRatio
        height: 1
        x: 50 * Style.widthRatio
        y: 220 * Style.heightRatio
        color: Style.isDark ? Style.iconInDark : Style.iconInLight
    }

    Rectangle {
        id: welcomeRect
        width: 80 * Style.widthRatio
        height: 80 * Style.widthRatio
        x: 60 * Style.widthRatio
        y: 260 * Style.heightRatio
        color: "transparent"
        Image {
            anchors.fill: parent
            source: "qrc:/icons/settings/EAE_FOTA_Logo.png"
            fillMode: Image.PreserveAspectFit
        }
    }

    Rectangle {
        id: welcomeText
        width: parent.width / 1.7
        height: 80 * Style.widthRatio
        x: 160 * Style.widthRatio
        y: 254 * Style.heightRatio
        color: "transparent"

        ColumnLayout {
            anchors.fill: parent
            anchors.margins: 12 * Style.widthRatio
            spacing: 4 * Style.heightRatio

            Text {
                text: "Welcome,"
                font.family: Style.fontFamily
                font.pixelSize: 24 * Style.heightRatio
                color: Style.isDark ? Style.white : Style.black
            }

            Text {
                text: "EAE FOTA Team"
                font.family: Style.fontFamily
                font.bold: true
                font.pixelSize: 24 * Style.heightRatio
                color: Style.isDark ? Style.white : Style.black
            }
        }
    }
}
