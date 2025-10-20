import QtQuick 2.12
import QtQuick.Controls 2.5
import QtQuick.Layouts 1.3
import QtGraphicalEffects 1.12

import Style 1.0

import "../components"

Page {
    id: settingPage
    width: 1920 * Style.widthRatio
    height: 1200 * Style.heightRatio

    background: Loader {
        anchors.fill: parent
        sourceComponent: backgroundRect
    }

    Component {
        id: backgroundRect
        Rectangle {
            anchors.fill: parent
            color: Style.isDark ? Style.gptDarkBg : Style.gptLightBg
        }
    }

    Header {
        z: 99
        id: headerLayout
    }

}
