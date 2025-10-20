import QtQuick 2.12
import QtQuick.Controls 2.5
import QtQuick.Layouts 1.3
import QtGraphicalEffects 1.12

import Style 1.0

import "../components"

Page {
    id: homeScreenPage
    width: 1920 * Style.widthRatio
    height: 1200 * Style.heightRatio

    // Component.onCompleted: {
    //     console.log("HomeScreen dimensions - Width:", homeScreenPage.width, "Height:", homeScreenPage.height)
    // }

    background: Loader {
        anchors.fill: parent
        sourceComponent: Style.mapAreaVisible ? backgroundRect : backgroundImage
    }

    Component {
        id: backgroundRect
        Rectangle {
            anchors.fill: parent
            color: "#171717"
        }
    }

    Component {
        id: backgroundImage
        Image {
            source: Style.getImageBasedOnTheme()
            Icon {
                icon.source: Style.getLockIconBasedOnTheme()
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.verticalCenter: parent.verticalCenter
                anchors.verticalCenterOffset: - 350 * Style.heightRatio
                anchors.horizontalCenterOffset: 37 * Style.widthRatio
                scale: 0.35 + 0.5 * Style.heightRatio
            }

            Icon {
                icon.source: Style.getPowerIconBasedOnTheme()
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.verticalCenter: parent.verticalCenter
                anchors.verticalCenterOffset: - 77 * Style.heightRatio
                anchors.horizontalCenterOffset: 550 * Style.widthRatio
                scale: 0.35 + 0.5 * Style.heightRatio
            }
        }
    }

    Header {
        z: 99
        id: headerLayout
    }

    TopLeftButtonIconColumn {
        z: 99
        anchors.left: parent.left
        anchors.top: headerLayout.bottom
        anchors.leftMargin: 18 * Style.widthRatio
    }

    RowLayout {
        id: mapLayout
        visible: Style.mapAreaVisible
        spacing: 0
        anchors.fill: parent
        Item {
            Layout.preferredWidth: 630 * (1200 * Style.widthRatio / 1180)
            Layout.fillHeight: true
            Image {
                id: sidebarImage
                anchors.centerIn: parent
                source: Style.getSidebarIconBasedOnTheme()
                scale: 1.05 * Style.widthRatio // 1200 / 1180
            }
        }

        // Rectangle {
        //     // Sidebar image have fixed dimensions: width = 730, height = 1180. scale it to match the height of the home screen
        //     width: (730 * (1200 * Style.heightRatio
        //     height: 1200 * Style.heightRatio
        //     x: 0
        //     y: 0
        //     color: "red"

        //     // Debug
        //     Component.onCompleted: {
        //         console.log("Sidebar dimensions - Width:", width, "Height:", height)
        //     }

        //     Image {
        //         id: highBeamImage
        //         source: "qrc:/images/high_beam.png"
        //         visible: false
        //         anchors.fill: parent
        //         fillMode: Image.PreserveAspectFit
        //     }
        // }

        NavigationMapHelperScreen {
            Layout.fillWidth: true
            Layout.fillHeight: true
            runMenuAnimation: true
        }
    }
}
