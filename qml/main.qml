import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15
import QtGraphicalEffects 1.15
import "controls"
Window {
    id: mainWindow
    width: 1000
    height: 580
    visible: true
    color: "#00000000"
    title: qsTr("Course Qt Quick")

    // Remove title bar
    flags: Qt.Window | Qt.FramelessWindowHint
    // Properties
    property int windowStatus: 0
    property int windowMargin: 10
    //Internal function
    QtObject{
        id: internal
        function resetResizeBorders(isVisible){
            resizeLeft.visible=isVisible
            resizeRight.visible=isVisible
            resizeBottom.visible=isVisible
            resizeTop.visible=isVisible
            resizeWindow.visible=isVisible
        }

        // windowStatus 0 is currently small and 1 is big
        function maximizeRestore(){
            if (windowStatus==0){
                mainWindow.showMaximized()
                windowStatus=1
                windowMargin=0
                //Resize visibility
                resetResizeBorders(false)
                btnRestoreMaximize.btnIconSource="../images/svg_images/restore_icon.svg"
            } else{
                mainWindow.showNormal()
                windowStatus=0
                windowMargin=10
                //Resize visibility
               resetResizeBorders(true)
                btnRestoreMaximize.btnIconSource="../images/svg_images/maximize_icon.svg"
            }
        }
        function ifMaximizedWindowRestore(){
            if (windowStatus==1){
                mainWindow.showNormal()
                windowStatus=0
                windowMargin=10
                //Resize visibility
                resetResizeBorders(true)
                btnRestoreMaximize.btnIconSource="../images/svg_images/maximize_icon.svg"
            }
        }
        function restoreMargins(){
            windowStatus=0
            windowMargin=10
            resetResizeBorders(true)
            btnRestoreMaximize.btnIconSource="../images/svg_images/maximize_icon.svg"

        }
    }

    Rectangle {
        id: bg
        color: "#2c313c"
        border.color: "#353b48"
        border.width: 1
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        anchors.rightMargin: windowMargin
        anchors.leftMargin: windowMargin
        anchors.bottomMargin: windowMargin
        anchors.topMargin: windowMargin
        z: 1
        Rectangle {
            id: appContainer
            color: "#00000000"
            anchors.fill: parent
            anchors.rightMargin: 1
            anchors.leftMargin: 1
            anchors.bottomMargin: 1
            anchors.topMargin: 1

            Rectangle {
                id: topBar
                height: 60
                color: "#21242c"
                anchors.left: parent.left
                anchors.right: parent.right
                anchors.top: parent.top
                anchors.rightMargin: 0
                anchors.leftMargin: 0
                anchors.topMargin: 0

                ToggleButton{
                    onClicked: animationMenu.running = true
                }

                Rectangle {
                    id: topBarDescription
                    y: 28
                    height: 25
                    color: "#282c34"
                    anchors.left: parent.left
                    anchors.right: parent.right
                    anchors.bottom: parent.bottom
                    anchors.rightMargin: 0
                    anchors.leftMargin: 70
                    anchors.bottomMargin: 0

                    Label {
                        id: labelTopInfo
                        color: "#696a6b"
                        text: qsTr("Application description")
                        anchors.left: parent.left
                        anchors.right: parent.right
                        anchors.top: parent.top
                        anchors.bottom: parent.bottom
                        verticalAlignment: Text.AlignVCenter
                        anchors.bottomMargin: 0
                        anchors.rightMargin: 300
                        anchors.leftMargin: 10
                        anchors.topMargin: 0
                    }

                    Label {
                        id: labelRightInfo
                        color: "#696a6b"
                        text: qsTr("| HOME")
                        anchors.left: labelTopInfo.right
                        anchors.right: parent.right
                        anchors.top: parent.top
                        anchors.bottom: parent.bottom
                        horizontalAlignment: Text.AlignRight
                        verticalAlignment: Text.AlignVCenter
                        anchors.topMargin: 0
                        anchors.leftMargin: 0
                        anchors.bottomMargin: 0
                        anchors.rightMargin: 10
                    }
                }

                Rectangle {
                    id: titleBar
                    height: 35
                    color: "#00000000"
                    anchors.left: parent.left
                    anchors.right: parent.right
                    anchors.top: parent.top
                    anchors.rightMargin: 105
                    anchors.leftMargin: 70
                    anchors.topMargin: 0
                    DragHandler{
                        onActiveChanged: if (active){
                                             mainWindow.startSystemMove()
                                             internal.ifMaximizedWindowRestore()
                                         }
                    }

                    Image {
                        id: iconApp
                        width: 22
                        height: 22
                        anchors.left: parent.left
                        anchors.top: parent.top
                        anchors.bottom: parent.bottom
                        source: "../images/svg_images/icon_app_top.svg"
                        anchors.leftMargin: 5
                        anchors.bottomMargin: 0
                        anchors.topMargin: 0
                        fillMode: Image.PreserveAspectFit
                    }

                    Label {
                        id: label
                        color: "#c7d2dc"
                        text: qsTr("My Application title")
                        anchors.left: iconApp.right
                        anchors.right: parent.right
                        anchors.top: parent.top
                        anchors.bottom: parent.bottom
                        verticalAlignment: Text.AlignVCenter
                        font.pointSize: 10
                        anchors.leftMargin: 5
                    }
                }

                Row {
                    id: rowBtns
                    x: 888
                    width: 105
                    height: 35
                    anchors.right: parent.right
                    anchors.top: parent.top
                    anchors.rightMargin: 0
                    anchors.topMargin: 0

                    TopbarButton {
                        id: btnMinimize
                        onClicked: {
                            mainWindow.showMinimized()
                            internal.restoreMargins()
                        }
                    }

                    TopbarButton {
                        id: btnRestoreMaximize
                        btnIconSource: "../images/svg_images/maximize_icon.svg"
                        onClicked: internal.maximizeRestore()
                    }

                    TopbarButton {
                        id: btnClose
                        btnIconSource: "../images/svg_images/close_icon.svg"
                        onClicked: mainWindow.close()
                    }
                }
            }

            Rectangle {
                id: content
                color: "#00000000"
                anchors.left: parent.left
                anchors.right: parent.right
                anchors.top: topBar.bottom
                anchors.bottom: parent.bottom
                anchors.rightMargin: 0
                anchors.bottomMargin: 0
                anchors.leftMargin: 0
                anchors.topMargin: 0

                Rectangle {
                    id: leftMenu
                    width: 70
                    color: "#21242c"
                    anchors.left: parent.left
                    anchors.top: parent.top
                    anchors.bottom: parent.bottom
                    clip: true
                    anchors.bottomMargin: 0
                    anchors.topMargin: 0
                    anchors.leftMargin: 0

                    PropertyAnimation{
                        id: animationMenu
                        target: leftMenu
                        property: "width"
                        to: leftMenu.width == 70 ? 250 : 70
                        duration: 500
                        easing.type: Easing.OutQuint
                    }

                    Column {
                        id: columnMenus
                        anchors.left: parent.left
                        anchors.right: parent.right
                        anchors.top: parent.top
                        anchors.bottom: parent.bottom
                        anchors.rightMargin: 0
                        anchors.leftMargin: 0
                        anchors.bottomMargin: 90
                        anchors.topMargin: 0

                        LeftMenuBtn{
                            id: btnHome
                            width: leftMenu.width
                            text: qsTr("Home")
                            isActiveMenu: true
                        }

                        LeftMenuBtn {
                            id: btnHome1
                            width: leftMenu.width
                            visible: true
                            text: qsTr("Open")
                            isActiveMenu: false
                            wheelEnabled: false
                            display: AbstractButton.TextBesideIcon
                            clip: false
                            btnIconSource: "../images/svg_images/open_icon.svg"
                        }

                        LeftMenuBtn {
                            id: btnHome2
                            width: leftMenu.width
                            text: qsTr("Save")
                            btnIconSource: "../images/svg_images/save_icon.svg"
                        }
                    }

                    LeftMenuBtn {
                        id: btnHome3
                        width: leftMenu.width
                        text: qsTr("Setting")
                        anchors.bottom: parent.bottom
                        anchors.bottomMargin: 25
                        btnIconSource: "../images/svg_images/settings_icon.svg"
                    }
                }

                Rectangle {
                    id: contentPages
                    color: "#2c313c"
                    anchors.left: leftMenu.right
                    anchors.right: parent.right
                    anchors.top: parent.top
                    anchors.bottom: parent.bottom
                    anchors.rightMargin: 0
                    anchors.leftMargin: 0
                    anchors.bottomMargin: 25
                    anchors.topMargin: 0
                }

                Rectangle {
                    id: rectangle
                    width: 200
                    color: "#282c34"
                    anchors.left: leftMenu.right
                    anchors.right: parent.right
                    anchors.top: contentPages.bottom
                    anchors.bottom: parent.bottom
                    anchors.rightMargin: 0
                    anchors.leftMargin: 0
                    anchors.bottomMargin: 0
                    anchors.topMargin: 0

                    Label {
                        id: labelTopInfo1
                        color: "#696a6b"
                        text: qsTr("Application description")
                        anchors.left: parent.left
                        anchors.right: parent.right
                        anchors.top: parent.top
                        anchors.bottom: parent.bottom
                        verticalAlignment: Text.AlignVCenter
                        anchors.rightMargin: 30
                        anchors.topMargin: 0
                        anchors.bottomMargin: 0
                        anchors.leftMargin: 0
                    }

                    MouseArea {
                        id: resizeWindow
                        x: 79
                        y: 8
                        width: 25
                        height: 25
                        anchors.right: parent.right
                        anchors.bottom: parent.bottom
                        anchors.bottomMargin: 0
                        anchors.rightMargin: 0
                        cursorShape: Qt.SizeFDiagCursor
                        DragHandler{
                            onActiveChanged: if (active){
                                                 mainWindow.startSystemResize(Qt.BottomEdge | Qt.RightEdge)
                                             }
                        }

                        Image {
                            id: resizeImage
                            opacity: 0.5
                            anchors.fill: parent
                            source: "../images/svg_images/resize_icon.svg"
                            sourceSize.height: 16
                            sourceSize.width: 16
                            fillMode: Image.PreserveAspectFit
                            antialiasing: false
                        }
                    }
                }
            }
        }
    }
    DropShadow{
        anchors.fill: bg
        source: bg
        horizontalOffset: 0
        verticalOffset: 0
        radius: 10
        samples: 16
        color: "#80000000"
        z: 0
    }

    MouseArea {
        id: resizeLeft
        width: 10
        anchors.left: parent.left
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        anchors.leftMargin: 0
        anchors.bottomMargin: 10
        anchors.topMargin: 10
        cursorShape: Qt.SizeHorCursor
        DragHandler{
            target: null
            onActiveChanged: if (active){
                                 mainWindow.startSystemResize(Qt.LeftEdge)
                             }
        }
    }
    MouseArea {
        id: resizeRight
        width: 10
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        anchors.rightMargin: 0
        anchors.bottomMargin: 10
        anchors.topMargin: 10
        cursorShape: Qt.SizeHorCursor
        DragHandler{
            target: null
            onActiveChanged: if (active){
                                 mainWindow.startSystemResize(Qt.RightEdge)
                             }
        }
    }
    MouseArea {
        id: resizeTop
        height: 10
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.leftMargin: 0
        anchors.rightMargin: 0
        anchors.topMargin: 0
        cursorShape: Qt.SizeVerCursor
        DragHandler{
            target: null
            onActiveChanged: if (active){
                                 mainWindow.startSystemResize(Qt.TopEdge)
                             }
        }
    }
    MouseArea {
        id: resizeBottom
        height: 10
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.bottom: parent.bottom
        anchors.rightMargin: 0
        anchors.leftMargin: 0
        anchors.bottomMargin: 0
        cursorShape: Qt.SizeVerCursor
        DragHandler{
            target: null
            onActiveChanged: if (active){
                                 mainWindow.startSystemResize(Qt.BottomEdge)
                             }
        }
    }
}







/*##^##
Designer {
    D{i:0;formeditorZoom:1.1}D{i:30}D{i:36}D{i:38}
}
##^##*/
