import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Shapes 1.15

Item {

    width: parent.width
    height : 40
    z : 10

    MouseArea {
        anchors.fill: parent
        property point lastMousePos: Qt.point(0, 0)
        onPressed: { lastMousePos = Qt.point(mouseX, mouseY); }
        onMouseXChanged: mainwindow.x += (mouseX - lastMousePos.x)
        onMouseYChanged: mainwindow.y += (mouseY - lastMousePos.y)
    }

    Rectangle{
        id : base
        width: parent.width
        height : parent.height
        color : "#37153a"

        Button{
            id : btn_exit
            width: 15
            height: 15
            x : parent.x + 10
            background: Rectangle {
                radius: width / 2
                color : "#ff786d"
            }
            anchors.verticalCenter: parent.verticalCenter

            onClicked: {
                mainwindow.close()
            }
        }

        Button{
            id : btn_minimize
            width: 15
            height: 15

            background: Rectangle {
                radius: width / 2
                color : "#ffd968"
            }
            anchors.verticalCenter: parent.verticalCenter
            anchors.left: btn_exit.right
            anchors.margins: 10
            onClicked: {
                showMinimized()
            }
        }

        Button{
            property bool selected: false

            id : btn_maximize
            width: 15
            height: 15

            background: Rectangle {
                radius: width / 2
                color : "#74df6b"
            }
            anchors.verticalCenter: parent.verticalCenter
            anchors.left: btn_minimize.right
            anchors.margins: 10
            onClicked: {
                searchbar.hovered
                if(selected == false)
                {
                    showMaximized()
                    selected = true
                }
                else
                {
                    showNormal()
                    selected = false
                }
            }
        }

        TextField {
            id : searchbar
            width: parent.width / 2
            height: parent.height * 2 / 3
            anchors.verticalCenter: parent.verticalCenter
            anchors.horizontalCenter: parent.horizontalCenter
            selectByMouse: true
            cursorVisible: false

            placeholderText: "\uD83D\uDD0D   Search DesignersKR"
            placeholderTextColor: hovered ? "transparent" : "white"

            leftPadding : (searchbar.width / 2) - (placeholderText.length /2 ) * font.family.length + 10
            bottomPadding: 5
            color: "#f7f1f8"

            cursorPosition: 10
            background: Rectangle{
                radius: 6
                color: "#48274b"
                border{
                    width: 1
                    color : "#755a77"
                }
            }

            Component.onCompleted: {
            }

            onPressed: {
                searchbar.cursorVisible = true
            }

            onHoveredChanged: {
                if(!hovered && searchbar.text.length === 0)
                {
                    searchbar.cursorVisible = false
                    leftPadding = (searchbar.width / 2) - (placeholderText.length /2 ) * font.family.length + 10
                }
                else
                {
                    leftPadding = 15
                }
            }
        }

        Button {
            id : btn_back
            Text {
                id : backtxt
                anchors.centerIn: parent
                topPadding: 4
                text: "🡨"
                color: "#c1b8c2"
            }
            width: 30
            height: 30
            background: Rectangle{
                color: "transparent"
            }
            anchors.verticalCenter: parent.verticalCenter
            anchors.right: btn_front.left

            onClicked: {
                backtxt.color = "#837085"
            }
        }

        Button{
            id : btn_front
            Text {
                id : fronttxt
                anchors.centerIn: parent
                topPadding: 4
                text: "🡪"
                color: "#c1b8c2"
            }
            width: 30
            height: 30
            background: Rectangle{
                color: "transparent"
            }
            anchors.verticalCenter: parent.verticalCenter
            anchors.right: btn_history.left

            onClicked: {
                fronttxt.color = "#837085"
            }
        }

        Button {
            id : btn_history
            Text {
                id : historytxt
                anchors.centerIn: parent
                topPadding: 4
                text : "⌚"
                color: "#c1b8c2"
            }
            width: 30
            height: 30
            background: Rectangle{
                color: "transparent"
            }
            anchors.verticalCenter: parent.verticalCenter
            anchors.right: searchbar.left

            onClicked: {
                historytxt.color = "#837085"
            }
        }

        Button{
            id : btn_help
            width: 25
            height: 25
            anchors.verticalCenter: parent.verticalCenter
            anchors.left: searchbar.right
            anchors.margins: 10

            background: Rectangle{

                color : "transparent"
                border.color: "white"
                border.width: 2

                radius: width / 2

                Rectangle{
                    color : "white"
                    width: parent.width / 2
                    height: parent.height / 2
                    border.color: "#301134"
                    border.width: 1
                    radius: width / 2
                    x : parent.x + parent.width - width/2
                    y : parent.y
                }
            }

            Text {
                text: "?"
                anchors.centerIn: parent
                color : "white"
            }
        }

        Rectangle{
            id : rect_container
            width: 61
            height: 30
            anchors.right: parent.right
            anchors.verticalCenter: parent.verticalCenter
            anchors.margins: 10
            radius: 5
            color : "transparent"
            border.width: 3
            border.color: "#37153a"
            z : 100

            Rectangle{
                width: 15
                height: 15
                anchors.right: parent.right
                anchors.bottom: parent.bottom
                color : "#56a97a"
                radius: width/ 2
                border.color : "#37153a"
                border.width: 3
            }
        }
        Rectangle{
            id : rect_purple
            width: 30
            height: rect_container.height - 5
            anchors.left: rect_container.left
            anchors.verticalCenter: rect_container.verticalCenter
            z : 0
            color : "#442848"
        }
        Rectangle{
            width: 30
            height: rect_container.height - 5
            anchors.left: rect_purple.right
            anchors.verticalCenter: rect_container.verticalCenter
            z : 0
            gradient: Gradient{
                GradientStop{
                    position: 0.0
                    color: "#b23200"
                }
                GradientStop{
                    position: 1.0
                    color : "#f4a800"
                }
            }
        }
    }
}
