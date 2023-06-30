import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15


Window {
    id : mainwindow
    width: 700
    height: 480
    visible: true
    title: qsTr("Hello World")
    flags: Qt.FramelessWindowHint | Qt.Window
    color: "white"


    x: (Screen.width - width)/2
    y: (Screen.height - height)/2

    Topbar{
        id : topbar
        anchors.top: parent.top
    }
    Leftbar{
        id: leftbar
        width: 50
        height: parent.height - topbar.height
        anchors.left: parent.left
        anchors.top: topbar.bottom
    }

    ContactList{
        id : contactbar
        width: parent.width / 4 >= 200 ? parent.width / 4  : 200
        height: parent.height - topbar.height
        anchors.left: leftbar.right
        anchors.top: topbar.bottom
    }

    Chatview{
        id : chatView
        width: parent.width - leftbar.width - contactbar.width
        height: parent.height - topbar.height
        anchors.top: topbar.bottom
        anchors.left: contactbar.right
    }

    MouseArea{
        id : bottomright
        width: 10
        height: 10
        anchors.bottom: parent.bottom
        anchors.right: parent.right


        cursorShape: Qt.SizeAllCursor
        acceptedButtons: Qt.LeftButton
        pressAndHoldInterval: 100
        onPressAndHold:
        {
            mainwindow.startSystemResize(Qt.BottomEdge | Qt.RightEdge)
        }
    }

    MouseArea{
        id : right
        width: 5
        height: parent.height
        anchors.right: parent.right


        cursorShape: Qt.SizeHorCursor
        acceptedButtons: Qt.LeftButton
        pressAndHoldInterval: 100
        onPressAndHold:
        {
            mainwindow.startSystemResize(Qt.RightEdge)
        }
    }

    MouseArea{
        id : left
        width: 5
        height: parent.height - 5
        anchors.left: parent.left
        anchors.top: parent.top

        cursorShape: Qt.SizeHorCursor
        acceptedButtons: Qt.LeftButton
        pressAndHoldInterval: 100
        onPressAndHold:
        {
            mainwindow.startSystemResize(Qt.LeftEdge)
        }
    }

    MouseArea{
        id : botton
        width: parent.width - 10
        height: 5
        anchors.bottom: parent.bottom
        anchors.horizontalCenter: parent.horizontalCenter


        cursorShape: Qt.SizeVerCursor
        acceptedButtons: Qt.LeftButton
        pressAndHoldInterval: 100
        onPressAndHold:
        {
            mainwindow.startSystemResize(Qt.BottomEdge)
        }
    }

    MouseArea{
        id : bottomleft
        width: 10
        height: 10
        anchors.bottom: parent.bottom
        anchors.left: parent.left


        cursorShape: Qt.SizeAllCursor
        acceptedButtons: Qt.LeftButton
        pressAndHoldInterval: 100
        onPressAndHold:
        {
            mainwindow.startSystemResize(Qt.BottomEdge | Qt.LeftEdge)
        }
    }
}
