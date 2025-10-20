import QtQuick 2.12
import QtQuick.Controls 2.5
import QtQuick.Layouts 1.3
import Style 1.0
import QtGraphicalEffects 1.12

Rectangle {
    width: parent.width
    height: 160 * Style.heightRatio
    // radius: 30 * Style.heightRatio
    // clip: true
    // border.color: Style.isDark ? "black" : "white"
    // border.width: 3
    color: "transparent"

    signal launcherClicked()
    signal settingClicked()

    Rectangle {
        id: footerBar
        width: parent.width - 40 * Style.widthRatio
        height: parent.height - 40 * Style.heightRatio
        anchors.centerIn: parent
        radius: 10 * Style.heightRatio
        color: "transparent"
        clip: true

        // Blur background
        FastBlur {
            anchors.fill: parent
            source: parent
            radius: 30 // Adjust the blur radius as needed
        }

        // Overlay to simulate frosted glass effect
        Rectangle {
            anchors.fill: parent
            color: Style.alphaColor(Style.black,0.3)
            radius: 20 * Style.heightRatio
        }

        Icon {
            id: leftControl
            icon.source: "qrc:/icons/app_icons/model-3.svg"
            anchors.verticalCenter: parent.verticalCenter
            anchors.left: parent.left
            anchors.leftMargin: 36 * Style.widthRatio
            onClicked: launcherClicked()
            scale: 0.5 + 0.5 * Style.heightRatio
        }

        Item {
            height: parent.height
            anchors.left: leftControl.right
            anchors.right: middleLayout.left
            anchors.verticalCenter: parent.verticalCenter

            StepperControl {
                anchors.centerIn: parent
                value: 72
            }
        }

        RowLayout {
            id: middleLayout
            anchors.centerIn: parent
            spacing: 10 * Style.widthRatio
            width: 580 * Style.widthRatio
            height: 60 * Style.heightRatio

            Repeater {
                model: [
                    "phone.svg",
                    "radio.svg",
                    "bluetooth.svg",
                    "spotify.svg",
                    "dashcam.svg",
                    "video.svg",
                    "tunein.svg"
                ]
                delegate: Rectangle {
                    color: "transparent"
                    Layout.fillHeight: true
                    Layout.preferredWidth: 50 * Style.widthRatio
                    Icon {
                        anchors.centerIn: parent
                        icon.source: "qrc:/icons/app_icons/" + modelData
                        scale: 0.5 + 0.5 * Style.heightRatio
                    }
                }
            }
        }

        StepperControl {
            id: volumeControl
            anchors.right: settingIcon.left
            anchors.left: middleLayout.right
            anchors.verticalCenter: parent.verticalCenter
            anchors.leftMargin: 150 * Style.widthRatio
            anchors.rightMargin: 150 * Style.widthRatio
            value: 72
            icon: "qrc:/icons/app_icons/volume.svg"
        }

        Icon {
            id: settingIcon
            icon.source: "qrc:/icons/app_icons/setting.svg"
            anchors.verticalCenter: parent.verticalCenter
            anchors.right: parent.right
            anchors.rightMargin: 36 * Style.widthRatio
            onClicked: settingClicked()
            scale: 0.5 + 0.5 * Style.heightRatio
        }
    }
}
