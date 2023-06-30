import QtQuick 2.15
import QtQuick.Layouts 1.15
import QtQuick.Controls 2.15

Item {
    signal channel_changed(string channelName)
    ScrollView{
        anchors.fill: parent
        contentHeight: parent.height < 1200 ? 1000 : parent.height
        //        ScrollBar.vertical.policy: ScrollBar.AlwaysOn
        Rectangle{
            id : firtsSelection
            width: parent.width
            height: 60
            border{
                color : "#522752"
                width: 1
            }
            color : "#3f0f3f"

            Text {
                text: "Test"
                color : "white"
                font{
                    bold: true
                }

                anchors.verticalCenter: parent.verticalCenter
                padding: 10
            }

            Text {
                text: "⌄"
                color : "white"
                font{
                    bold: true
                    pixelSize: 20
                }

                anchors.centerIn: parent
                padding: 10
            }

            Image {
                source: "qrc:/images/images/memo.svg"
                anchors.verticalCenter: parent.verticalCenter
                anchors.right: parent.right
                anchors.margins: 10
            }


        }

        Rectangle{
            width: parent.width
            height: parent.height - firtsSelection.height
            anchors.top: firtsSelection.bottom
            color : "#3f0f3f"

            Rectangle{
                id : mention

                anchors.top: parent.top
                width: parent.width
                height: 20
                color : "transparent"
                anchors.margins: 5

                Image {
                    id: img_mention
                    source: "qrc:/images/images/mention.svg"
                    anchors.verticalCenter: parent.verticalCenter
                    x : parent.x + 5
                }

                Text {
                    id : txt_mention
                    x : parent.x + 20
                    text: "Mentions & reactions"
                    font.bold: true
                    color : "#b4a2b4"
                    anchors.margins: 2
                    anchors.verticalCenter: parent.verticalCenter
                    leftPadding: 4
                }
            }

            Rectangle{
                id : saved_items

                anchors.top: mention.bottom
                width: parent.width
                height: 20
                color : "transparent"
                anchors.margins: 5

                Image {
                    id: img_saved_item
                    source: "qrc:/images/images/bookmark.svg"
                    anchors.verticalCenter: parent.verticalCenter
                    x : parent.x + 6
                }

                Text {
                    id : txt_saved_item
                    x : parent.x + 20
                    text: "Saved items"
                    font.bold: true
                    color : "#b4a2b4"
                    anchors.margins: 2
                    anchors.verticalCenter: parent.verticalCenter
                    leftPadding: 4
                }
            }

            Rectangle{
                id : more

                anchors.top: saved_items.bottom
                width: parent.width
                height: 20
                color : "transparent"
                anchors.margins: 5

                Image {
                    id: img_more
                    source: "qrc:/images/images/more.svg"
                    anchors.verticalCenter: parent.verticalCenter
                    x : parent.x + 9

                }

                Text {
                    id : txt_more
                    x : parent.x + 20
                    font.bold: true
                    text: "More"
                    color : "#b4a2b4"
                    anchors.margins: 2
                    anchors.verticalCenter: parent.verticalCenter
                    leftPadding: 4
                }
            }

            Rectangle{
                id : channels

                anchors.top: more.bottom
                width: parent.width
                height: 20
                color : "transparent"
                anchors.margins: 5

                Text {
                    id: img_channels
                    text: "▶"
                    font.pixelSize: 10
                    color : "#c5b7c5"
                    anchors.verticalCenter: parent.verticalCenter
                    x : parent.x + 7
                }

                Text {
                    id : txt_channels
                    x : parent.x + 20
                    text: "Channels"
                    font.bold: true
                    color : "#b4a2b4"
                    anchors.margins: 2
                    anchors.verticalCenter: parent.verticalCenter
                    leftPadding: 4
                }


                MouseArea{
                    id : clickarea
                    property bool isPressed: false
                    anchors.fill: parent

                    onClicked: {
                        isPressed = !isPressed
                        if(!isPressed)
                        {
                            img_channels.text = "▶"
                        }
                        else
                        {
                            img_channels.text = "▼"
                        }
                    }
                }



                ListView {
                    id : channel_list
                    width: parent.width
                    height: clickarea.isPressed ? listmodel.count  * 20 : 0
                    visible: clickarea.isPressed
                    anchors.top: channels.bottom

                    model: ListModel {
                        id : listmodel
                        ListElement { name: "#  Channel-1"; selected : false }
                        ListElement { name: "#  Channel-2"; selected : false }
                        ListElement { name: "#  Channel-3"; selected : false }
                        ListElement { name: "#  Channel-4"; selected : false }
                        ListElement { name: "#  Channel-5"; selected : false }
                        ListElement { name: "#  Channel-6"; selected : false }
                        ListElement { name: "#  Channel-7"; selected : false }
                    }

                    delegate: Item {
                        width: ListView.view.width
                        height: 20
                        Rectangle {
                            width: parent.width
                            height: parent.height
                            color: model.selected ? "#2d649e" : "transparent"

                            Text {
                                leftPadding: 20
                                text: model.name
                                color : "#c5b7c5"
                            }
                        }

                        MouseArea{
                            anchors.fill: parent
                            onClicked: {
                                for(var i = 0; i < listmodel.count ; i++)
                                {
                                    listmodel.setProperty(i, "selected", false);
                                }
                                listmodel.setProperty(index, "selected", true);

                                channel_changed(listmodel.get(index).name)
                            }
                        }
                    }
                }

                Rectangle{
                    id : btn_add_new_channel
                    visible: clickarea.isPressed
                    anchors.top: channel_list.bottom
                    width: parent.width
                    height: 20

                    color: "transparent"
                    Rectangle{
                        id : plus_rect
                        width: 20
                        height: 20
                        anchors.top: parent.top
                        color: "#522752"
                        radius: 5
                        x : parent.x + 15
                        Text {
                            text: "+"
                            font.pixelSize: 20
                            anchors.centerIn: parent
                            color : "#c8bac8"
                        }
                    }

                    Text {
                        text: "Add channels"
                        anchors.left: plus_rect.right
                        leftPadding: 5
                        color : "#c8bac8"
                    }

                    MouseArea{
                        anchors.fill: parent
                        onClicked: {
                            console.log("i cloicke")
                            listmodel.append({name : "#  Channel-8", selected : false})
                            btn_add_new_channel.destroy()
                        }
                    }


                }
            }

            Rectangle{
                id : directs
                y : channel_list.visible ? (btn_add_new_channel ? channels.y + channel_list.height + 40  : channels.y + channel_list.height + channels.height) : channels.y + channels.height + 5
                width: parent.width
                height: 20
                color : "transparent"
                anchors.margins: 5

                Text {
                    id: img_directs
                    text: "▶"
                    font.pixelSize: 10
                    color : "#c5b7c5"
                    anchors.verticalCenter: parent.verticalCenter
                    x : parent.x + 7
                }

                Text {
                    id : txt_directs
                    x : parent.x + 20
                    text: "Direct messages"
                    font.bold: true
                    color : "#b4a2b4"
                    anchors.margins: 2
                    anchors.verticalCenter: parent.verticalCenter
                    leftPadding: 4
                }


                MouseArea{
                    id : directclickarea
                    property bool isPressed: false
                    anchors.fill: parent

                    onClicked: {
                        isPressed = !isPressed
                        if(!isPressed)
                        {
                            img_directs.text = "▶"
                        }
                        else
                        {
                            img_directs.text = "▼"
                        }
                    }
                }

                ColumnLayout{
                    width: parent.width
                    height: listdirect.count  * 30
                    visible: directclickarea.isPressed
                    anchors.top: directs.bottom
                    spacing : 5

                    ListView {
                        id : directs_list
                        width: parent.width
                        height: directclickarea.isPressed ? listdirect.count * 35: 0
                        visible: directclickarea.isPressed
                        spacing: 5

                        model: ListModel {
                            id : listdirect
                            ListElement { name : "HHH" ; url: "qrc:/profilepics/images/hhh.png"; online : true  ; isYou :true  }
                            ListElement { name : "Heal" ; url: "qrc:/profilepics/images/heal.png"; online : true  ; isYou :false }
                            ListElement { name : "Kamran" ; url: "qrc:/profilepics/images/heal.png"; online : false ; isYou :false }
                        }

                        delegate: Item {
                            width: ListView.view.width
                            height: 30
                            Rectangle {
                                width: parent.width
                                height: parent.height
                                color: model.selected ? "#2d649e" : "transparent"
                                x : parent.x + 15

                                Image {
                                    id : img_profile
                                    source: model.url
                                    width: parent.height
                                    height: parent.height - 1

                                    Rectangle{
                                        x : parent.x + parent.width - width /2
                                        y : parent.y + parent.height - height /2
                                        width: parent.width / 3
                                        height: parent.width / 3
                                        color : model.online ? "#56a97a" : "transparent"
                                        radius: width/2
                                        z : 100
                                    }

                                    Rectangle{
                                        x : parent.x + parent.width - width  /2
                                        y : parent.y + parent.height - height /2
                                        width: parent.width / 3
                                        height: parent.width / 3
                                        color : "#3f0f3f"
                                        radius: width/2
                                        border.color: "white"
                                        border.width: 1
                                        z : 1
                                    }

                                    Rectangle{
                                        x : parent.x + parent.width - width *2/3
                                        y : parent.y + parent.height - height *2/3
                                        width: parent.width / 2
                                        height: parent.width / 2
                                        color : "#3f0f3f"
                                        radius: width/2
                                        z : 0
                                    }
                                }

                                Text {
                                    id : txt_profile_name
                                    anchors.left: img_profile.right
                                    text: model.name
                                    color : "#c5b7c5"
                                    leftPadding: 5
                                }

                                Text {
                                    anchors.left: txt_profile_name.right
                                    text: model.isYou ? "you" : ""
                                    color : "#806080"
                                    leftPadding: 5
                                }
                            }
                        }
                    }

                    Rectangle{
                        id : btn_add_new_directs
                        visible: directclickarea.isPressed
                        width: parent.width
                        height: 30
                        color: "transparent"

                        Rectangle{
                            id : plus_direct
                            width: 30
                            height: 30
                            anchors.top: parent.top
                            color: "#522752"
                            radius: 5
                            x : parent.x + 15
                            Text {
                                text: "+"
                                font.pixelSize: 20
                                anchors.centerIn: parent
                                color : "#c8bac8"
                            }
                        }

                        Text {
                            text: "Add contacts"
                            anchors.left: plus_direct.right
                            leftPadding: 5
                            color : "#c8bac8"
                        }

                        MouseArea{
                            anchors.fill: parent
                            onClicked: {
                                listdirect.append({name : "hatalmas" ,url: "qrc:/profilepics/images/hhh.png", online : false , isYou :false })
                                btn_add_new_directs.destroy()
                            }
                        }
                    }
                }
            }
        }
    }
}
