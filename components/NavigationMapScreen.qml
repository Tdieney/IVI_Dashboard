// ******************************************
// ** Map and Route Simulation Page        **
// ******************************************
//
// This QML page simulates a map and route functionality using Mapbox and OpenStreetMap. It
// demonstrates the journey from a current location to a destination by animating a car marker
// along the calculated route. The animation includes tilting and rotating the map.
//
// Key Features:
// - Visualization of a map with a route line.
// - Animated car marker to simulate route traversal.
// - Map tilting and rotating animations.
// - GeoModel to find destination coordinates.
// - RouteModel to calculate the route.
//
// This page is intended for demonstration purposes and can be customized to fit your
// application's needs for displaying routes and geolocation data.
//
// ******************************************

import QtQuick 2.12
import QtLocation 5.6
import QtQml 2.3
import QtQuick.Controls 2.5
import QtGraphicalEffects 1.0
import QtPositioning 5.6
import Style 1.0

Page {
    id: pageMap

    property var currentLoc: QtPositioning.coordinate(10.8019, 106.6525)   // Tan Binh, HCM
    property bool isRoutingStart: false
    property bool runMapAnimation: false
    property bool enableGradient: true
    padding: 0

    function startAnimation() {
        geoModel.update()
    }

    // Gradient effect on edges
    RadialGradient {
        z: 1
        visible: enableGradient
        anchors.fill: parent
        gradient: Gradient {
            GradientStop { position: 0.0; color: "#00000000" }
            GradientStop { position: 0.72; color: "#000000" }
        }
    }

    // --- Main MAP ---
    Map {
        id: map
        anchors.fill: parent
        copyrightsVisible: false
        center: currentLoc
        zoomLevel: 13.3
        bearing: -80

        // Use OpenStreetMap tile server (free)
        plugin: Plugin {
            name: "osm"
            PluginParameter {
                name: "osm.mapping.custom.host"
                value: "https://tile.openstreetmap.org/{z}/{x}/{y}.png"
            }
        }

        // Show route line
        MapItemView {
            id: mapRouteLine
            model: routeModel
            delegate: Component {
                MapRoute {
                    route: routeData
                    line.color: "aqua"
                    line.width: 5
                }
            }
        }

        // Current location marker
        MapQuickItem {
            id: currentLocationMarker
            coordinate: currentLoc
            visible: false
            z: 1

            onCoordinateChanged: if (isRoutingStart) map.center = coordinate

            sourceItem: Image {
                width: 40 * (map.zoomLevel / 17)
                height: 40 * (map.zoomLevel / 17)
                source: "qrc:/icons/map/CarMarker.png"
                anchors.centerIn: parent
            }

            Behavior on coordinate { PropertyAnimation { duration: 500 } }
        }

        // Destination marker
        MapQuickItem {
            id: destinationMarker
            visible: false
            z: 1
            sourceItem: Image {
                width: 30 * (map.zoomLevel / 17)
                height: 30 * (map.zoomLevel / 17)
                source: "qrc:/icons/map/DestinationMarker.png"
                anchors.centerIn: parent
            }
        }

        // Start marker
        MapQuickItem {
            id: startMarker
            visible: false
            z: 1
            sourceItem: Image {
                width: 30 * (map.zoomLevel / 17)
                height: 30 * (map.zoomLevel / 17)
                source: "qrc:/icons/map/LocationMarker.png"
                anchors.centerIn: parent
            }
        }

        // RouteModel (run with osm)
        RouteModel {
            id: routeModel

            plugin: geoModel.plugin
            query: RouteQuery { id: routeQuery }

            onRoutesChanged: {
                if (count > 0) {
                    let route = routeModel.get(0)
                    map.center = route.path[Math.floor(route.path.length / 2)]
                    destinationMarker.coordinate = route.path[route.path.length - 1]
                    startMarker.coordinate = currentLoc
                    destinationMarker.visible = true
                    startMarker.visible = true
                    animationTimer.running = true
                }
            }
        }

        // Timer to start route animation
        Timer {
            id: animationTimer
            interval: 3000
            onTriggered: {
                startMarker.visible = false
                currentLocationMarker.visible = true
                isRoutingStart = true
                simulateDrive.path = routeModel.get(0).path
                routeStartAnimation.running = true
                simulateDrive.running = true
            }
        }

        // Simulate car driving along the route
        Timer {
            id: simulateDrive
            property var path
            property int index: 0
            interval: 1000
            repeat: true
            onTriggered: {
                if (index < path.length) {
                    currentLocationMarker.coordinate = path[index]
                    index++
                } else stop()
            }
        }

        // Geocode (find coordinates of destination point)
        GeocodeModel {
            id: geoModel
            plugin: Plugin {
                name: "osm"
                PluginParameter {
                    name: "osm.mapping.custom.host"
                    value: "https://tile.openstreetmap.org/{z}/{x}/{y}.png"
                }
            }
            query: "District 1, Ho Chi Minh City"   // Destination

            onLocationsChanged: {
                if (count) {
                    routeQuery.clearWaypoints()
                    routeQuery.addWaypoint(currentLoc)
                    routeQuery.addWaypoint(get(0).coordinate)
                    routeModel.update()
                }
            }
        }
    }

    // Animation zooming map
    SequentialAnimation {
        id: routeStartAnimation

        PropertyAnimation {
            duration: 1000
            target: map
            property: "center"
            to: currentLoc
        }

        NumberAnimation {
            duration: 3000
            target: map
            properties: "zoomLevel"
            from: map.zoomLevel
            to: 16
        }

        NumberAnimation {
            duration: 1000
            target: map
            properties: "tilt"
            from: 0
            to: map.maximumTilt
        }

        NumberAnimation {
            duration: 4000
            target: map
            properties: "bearing"
            from: -80
            to: 0
        }
    }
}
