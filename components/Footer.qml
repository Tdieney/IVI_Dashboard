import QtQuick 2.12
import QtQuick.Controls 2.5
import QtQuick.Layouts 1.3
import Style 1.0
import QtGraphicalEffects 1.12

Item {
    height: 120 * Style.heightRatio
    width: parent.width
    signal openLauncher()
    LinearGradient {
        anchors.fill: parent
        start: Qt.point(0, 0)
        end: Qt.point(0, 1000 * Style.heightRatio)
        gradient: Gradient {
            GradientStop { position: 0.0; color: Style.black }
            GradientStop { position: 1.0; color: Style.black60 }
        }
    }

    Icon{
        id: leftControl
        icon.source: "qrc:/icons/app_icons/model-3.svg"
        anchors.verticalCenter: parent.verticalCenter
        anchors.left: parent.left
        anchors.leftMargin: 36 * Style.widthRatio
        onClicked: openLauncher()
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

        Rectangle {
            color: "transparent"
            Layout.fillHeight: true
            Layout.preferredWidth: 50 * Style.widthRatio
            Icon{
                anchors.centerIn: parent
                icon.source: "qrc:/icons/app_icons/phone.svg"
                scale: 0.5 + 0.5 * Style.heightRatio
            }
        }

        Rectangle {
            color: "transparent"
            Layout.fillHeight: true
            Layout.preferredWidth: 50 * Style.widthRatio
            Icon{
                anchors.centerIn: parent
                icon.source: "qrc:/icons/app_icons/radio.svg"
                scale: 0.5 + 0.5 * Style.heightRatio
            }
        }

        Rectangle {
            color: "transparent"
            Layout.fillHeight: true
            Layout.preferredWidth: 50 * Style.widthRatio
            Icon{
                anchors.centerIn: parent
                icon.source: "qrc:/icons/app_icons/bluetooth.svg"
                scale: 0.5 + 0.5 * Style.heightRatio
            }
        }

        Rectangle {
            color: "transparent"
            Layout.fillHeight: true
            Layout.preferredWidth: 50 * Style.widthRatio
            Icon{
                anchors.centerIn: parent
                icon.source: "qrc:/icons/app_icons/spotify.svg"
                scale: 0.5 + 0.5 * Style.heightRatio
            }
        }

        Rectangle {
            color: "transparent"
            Layout.fillHeight: true
            Layout.preferredWidth: 50 * Style.widthRatio
            Icon{
                anchors.centerIn: parent
                icon.source: "qrc:/icons/app_icons/dashcam.svg"
                scale: 0.5 + 0.5 * Style.heightRatio
            }
        }

        Rectangle {
            color: "transparent"
            Layout.fillHeight: true
            Layout.preferredWidth: 50 * Style.widthRatio
            Icon{
                anchors.centerIn: parent
                icon.source: "qrc:/icons/app_icons/video.svg"
                scale: 0.5 + 0.5 * Style.heightRatio
            }
        }

        Rectangle {
            color: "transparent"
            Layout.fillHeight: true
            Layout.preferredWidth: 50 * Style.widthRatio
            Icon{
                anchors.centerIn: parent
                icon.source: "qrc:/icons/app_icons/tunein.svg"
                scale: 0.5 + 0.5 * Style.heightRatio
            }
        }
    }

    Item {
        height: parent.height
        anchors.right: rightControl.left
        anchors.left: middleLayout.right
        anchors.verticalCenter: parent.verticalCenter

        StepperControl {
            anchors.centerIn: parent
            value: 72
        }
    }

    StepperControl {
        id: rightControl
        anchors.verticalCenter: parent.verticalCenter
        anchors.right: parent.right
        anchors.rightMargin: 36 * Style.widthRatio
        value: 72
        icon: "qrc:/icons/app_icons/volume.svg"
    }
}
