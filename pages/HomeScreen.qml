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

    TopLeftButtonIconColumn {
        z: 99
        x: 14 * Style.widthRatio
        y: 54 * Style.heightRatio
        anchors.leftMargin: 18 * Style.widthRatio
    }

    RowLayout {
        id: mapLayout
        visible: Style.mapAreaVisible
        spacing: 0
        anchors.fill: parent
        Item {
            Layout.preferredWidth: 630 * (1200 * Style.widthRatio / 1180)
            Layout.fillHeight: 1200 * Style.heightRatio
            // Layout.fillHeight: true
            Image {
                id: sidebarImage
                anchors.centerIn: parent
                source: Style.getSidebarIconBasedOnTheme()
                scale: 1.05 * Style.widthRatio // 1200 / 1180
            }
        }

        NavigationMapHelperScreen {
            Layout.fillWidth: true
            Layout.fillHeight: true
            runMenuAnimation: true
        }
    }

    footer: Footer{
        id: footerLayout
        onLauncherClicked: {
            if (launcher.visible) {
                launcher.close()
            } else {
                launcher.open()
            }
        }

        onSettingClicked: {
            if (swipeView.currentIndex == 0) {
                swipeView.currentIndex = 1
            } else {
                swipeView.currentIndex = 0
            }
        }
    }
}
