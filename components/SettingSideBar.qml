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
            source: "qrc:/icons/settings/EAE_Logo.png"
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

    // ===== Scrollable List =====
    ScrollView {
        anchors.top: welcomeText.bottom
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.bottom: parent.bottom
        anchors.margins: 40 * Style.heightRatio
        Layout.fillWidth: true
        Layout.fillHeight: true
        clip: true

        ListView {
            id: chatList
            model: ListModel {
                ListElement { title: "Wi-Fi"; subtitle: "Connect to network"; icon: "qrc:/icons/wifi.png"; hasSwitch: true; checked: true }
                ListElement { title: "Bluetooth"; subtitle: "Device pairing"; icon: "qrc:/icons/bluetooth.png"; hasSwitch: true; checked: false }
                ListElement { title: "Sound"; subtitle: "Equalizer, balance, volume"; icon: "qrc:/icons/sound.png"; hasSwitch: false }
                ListElement { title: "Display"; subtitle: "Brightness, theme, contrast"; icon: "qrc:/icons/display.png"; hasSwitch: false }
                ListElement { title: "Navigation"; subtitle: "Map and route settings"; icon: "qrc:/icons/navigation.png"; hasSwitch: false }
                ListElement { title: "Vehicle"; subtitle: "Driving mode, sensors"; icon: "qrc:/icons/car.png"; hasSwitch: false }
                ListElement { title: "Language"; subtitle: "Change display language"; icon: "qrc:/icons/language.png"; hasSwitch: false }
                ListElement { title: "System"; subtitle: "About, updates, reset"; icon: "qrc:/icons/system.png"; hasSwitch: false }
            }

            delegate: Rectangle {
                width: parent.width
                height: 80 * Style.heightRatio
                color: ListView.isCurrentItem
                    ? (Style.isDark ? Style.gptDarkBox : Style.gptLightBox)
                    : (Style.isDark ? Style.gptDarkSideBar : Style.gptLightSideBar)

                radius: 10 * Style.heightRatio
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.margins: 10 * Style.heightRatio

                MouseArea {
                    anchors.fill: parent
                    onClicked: chatList.currentIndex = index
                }

                Text {
                    text: title
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.left: parent.left
                    anchors.leftMargin: 24 * Style.widthRatio
                    color: Style.isDark ? "white" : "black"
                    font.pixelSize: 24 * Style.heightRatio
                    elide: Text.ElideRight
                }
            }
        }
    }

    // ===== Footer =====
    // Rectangle {
    //     Layout.fillWidth: true
    //     Layout.preferredHeight: 70 * Style.heightRatio
    //     color: "transparent"
    //     border.color: Style.isDark ? "#2A2A2A" : "#DDDDDD"
    //     border.width: 1
    //     Row {
    //         anchors.fill: parent
    //         anchors.margins: 16 * Style.widthRatio
    //         spacing: 12 * Style.widthRatio

    //         Image {
    //             source: "qrc:/icons/app_icons/volume.svg"
    //             width: 20 * Style.widthRatio
    //             height: width
    //             fillMode: Image.PreserveAspectFit
    //         }

    //         Text {
    //             text: "New Chat"
    //             color: Style.isDark ? "#FFFFFF" : "#000000"
    //             font.pixelSize: 16 * Style.heightRatio
    //             verticalAlignment: Text.AlignVCenter
    //         }
    //     }
    // }
}
