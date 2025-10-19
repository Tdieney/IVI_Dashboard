pragma Singleton
import QtQuick 2.12

QtObject {
    readonly property color textColor: "#000000"

    readonly property color blueMedium: "#2E78FF"
    readonly property color blueLight: "#A8C3F4"
    readonly property color red: "#B74134"
    readonly property color redLight: "#ED4E3B"
    readonly property color yellow: "#FFBD0A"
    readonly property color green: "#25CB55"

    readonly property color black: "#000000"
    readonly property color black10: "#414141"
    readonly property color black20: "#757575"
    readonly property color black30: "#A2A3A5"
    readonly property color black40: "#D0D2D0"
    readonly property color black50: "#D0D1D2"
    readonly property color black60: "#E0E0E0"
    readonly property color black80: "#F0F0F0"
    readonly property color white: "#FFFFFF"
    readonly property string fontFamily: nunitoSans.name

    // Standard icon sizes
    readonly property int iconSizeSmall: 16
    readonly property int iconSizeMedium: 24  
    readonly property int iconSizeLarge: 32
    readonly property int iconSizeXLarge: 48

    readonly property FontLoader nunitoSans: FontLoader{
        source: "qrc:/fonts/NunitoSans-Regular.ttf"
    }


    property bool isDark: true
    property bool mapAreaVisible: false
    property string theme: isDark ? "dark" : "light"

    function getImageBasedOnTheme() {
        return `qrc:/icons/car_action_icons/${theme}/background_image.png`;
    }

    function getLockIconBasedOnTheme() {
        return `qrc:/icons/car_action_icons/${theme}/lock.svg`;
    }

    function getNavigationIconBasedOnTheme() {
        return `qrc:/icons/car_action_icons/${theme}/navigation.svg`;
    }

    function getPowerIconBasedOnTheme() {
        return `qrc:/icons/car_action_icons/${theme}/power.svg`;
    }

    function getUserIconBasedOnTheme() {
        return `qrc:/icons/top_header_icons/${theme}/icons.svg`;
    }

    function getSentryIconBasedOnTheme() {
        return `qrc:/icons/top_header_icons/${theme}/Sentry.svg`;
    }

    function alphaColor(color, alpha) {
        let actualColor = Qt.darker(color, 1)
        actualColor.a = alpha
        return actualColor
    }
}
