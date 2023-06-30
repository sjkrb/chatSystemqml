import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Controls.Imagine 2.15

//import QtGraphicalEffects 1.14

Item {
    id : parentid
    visible: false
    property string channelname: ""
    Connections{
        target : contactbar
        function onChannel_changed(channelName){
            parentid.channelname = channelName
            visible = true
        }
    }

    Rectangle{
        id : rect_top
        anchors.top: parent.top
        width: parent.width
        height: 60
        z : 10

        border{
            width: 1
            color : "#c4c4c4"
        }

        Text{
            id : txt_channel_name
            text : channelname
            color : "black"
            anchors.top: parent.top
            anchors.left: parent.left
            anchors.leftMargin: 10
            anchors.topMargin: 10
        }

        Text {
            text: "☆"
            font.pixelSize: 20
            color : "#6f6f6f"
            anchors.left: txt_channel_name.right
            anchors.leftMargin: 10
            anchors.verticalCenter: txt_channel_name.verticalCenter
        }

        Image {
            id: img_pin
            source: "qrc:/images/images/pin.svg"
            sourceSize.width: 15
            sourceSize.height: 15
            anchors.top: txt_channel_name.bottom
            anchors.left: parent.left
            anchors.margins: 10
        }

        Text {
            id : txt_13
            text: "13"
            color : "#6f6f6f"
            anchors.left: img_pin.right
            anchors.verticalCenter: img_pin.verticalCenter
            leftPadding: 5
        }

        Text {
            textFormat: Text.RichText
            anchors.left: txt_13.right
            anchors.verticalCenter: txt_13.verticalCenter
            leftPadding: 5
            Text {
                id : txt_mobile
                text: "|📱"
                font.family: "Segoe UI Emoji"
                color: "#7f7f7f"
                anchors.verticalCenter: parent.verticalCenter
            }

            Text {
                property string channelNumber: channelname.split("-")[1]

                text: "Channel for number " + channelNumber
                color: "#7f7f7f"
                leftPadding: 5
                anchors.verticalCenter: parent.verticalCenter
                anchors.left: txt_mobile.right
            }
        }

        Text {
            id: attention_mark
            text: "\u24D8"
            color : "#606060"
            font.pixelSize: 20
            anchors.right: parent.right
            anchors.verticalCenter: parent.verticalCenter
            rightPadding: 10
        }

        Image {
            id: add_num
            source: "qrc:/images/images/addContact.svg"
            anchors.right: attention_mark.left
            anchors.verticalCenter: parent.verticalCenter
            anchors.margins: 5
        }
        Text {
            id: txt_493
            text: "493"
            anchors.right: add_num.left
            anchors.verticalCenter: parent.verticalCenter
            color : "black"
            anchors.margins: 20
        }

        Image {
            id: first_pic
            source: "qrc:/profilepics/images/bluerock.png"
            anchors.verticalCenter: parent.verticalCenter
            anchors.right: txt_493.left
            anchors.rightMargin: 20
        }

        Image {
            id: second_pic
            source: "qrc:/profilepics/images/fire.png"
            anchors.verticalCenter: parent.verticalCenter
            y : first_pic.y
            x : first_pic.x - 15
        }

        Image {
            id: third_pic
            source: "qrc:/profilepics/images/something.png"
            anchors.verticalCenter: parent.verticalCenter
            y : second_pic.y
            x : second_pic.x - 15
        }
    }


    ListView{
        width: parent.width
        height: parent.height - rect_top.height - rect_down.height
        anchors.top: rect_top.bottom
        anchors.right: parent.right
        verticalLayoutDirection: ListView.BottomToTop
        spacing: 10
        topMargin: 10

        id : listview
        model : ListModel{
            id : listmodel
            ListElement {
                name : "Heal"
                content : "그 안에서 나는 작은 하나의 이야기가 되어 흘러간다."
                profile_pic : "qrc:/profilepics/images/heal.png"
                reply_profiles : ""
                date : "today"
                time : "6:49 PM"
                last_reply_time : ""
                emojies : "like"
                isNew : true
            }
            ListElement {
                name : "Kamran"
                content : "봄날의 햇살 따라 새벽길을 걷네, 작은 꽃들이 눈부신 향기를 품고 서로 맞닿아 웃네. 나비들은 춤추며 색다른 세계를 만들어가고, 그 속에서 나는 풍경에 녹아들어 자유롭게 흘러가네.

어린 그림자들이 덧없이 노래하며 흐르고, 푸른 하늘은 감탄을 자아내며 펼쳐진다. 저 멀리 산들은 우리에게 약속을 전하고, 물결처럼 흐르는 강물은 시간을 담고 흘러간다.
끝없이 이어지는 세상의 수레바퀴, 그 안에서 나는 작은 하나의 이야기가 되어 흘러간다."
                profile_pic : "qrc:/profilepics/images/kamran.png"
                reply_profiles : "qrc:/profilepics/images/bird.png,qrc:/profilepics/images/sky.png,qrc:/profilepics/images/man.png,qrc:/profilepics/images/lights.png,qrc:/profilepics/images/airplane.png"
                date : "Monday,March 1th ⌄"
                time : "6:49 PM"
                last_reply_time : "3.12 AM"
                emojies : ""
                isNew : false
            }
            ListElement {
                name : "Kamran"
                content : "봄날의 햇살 따라 새벽길을 걷네, 작은 꽃들이 눈부신 향기를 품고 서로 맞닿아 웃네. 나비들은 춤추며 색다른 세계를 만들어가고, 그 속에서 나는 풍경에 녹아들어 자유롭게 흘러가네.

어린 그림자들이 덧없이 노래하며 흐르고, 푸른 하늘은 감탄을 자아내며 펼쳐진다. 저 멀리 산들은 우리에게 약속을 전하고, 물결처럼 흐르는 강물은 시간을 담고 흘러간다.
끝없이 이어지는 세상의 수레바퀴, 그 안에서 나는 작은 하나의 이야기가 되어 흘러간다."
                profile_pic : "qrc:/profilepics/images/kamran.png"
                reply_profiles : "qrc:/profilepics/images/bird.png,qrc:/profilepics/images/sky.png,qrc:/profilepics/images/man.png"
                date : "Monday,March 1th ⌄"
                time : "6:49 PM"
                last_reply_time : "3.12 AM"
                emojies : ""
                isNew : false
            }

        }

        delegate: Item {
            id: delegate_item
            width: parent.width
            height: 100

            Rectangle{
                id : txt_comment
                anchors.fill: parent

                Rectangle {
                    width: parent.width
                    anchors.top: parent.top
                    height: 2
                    color: "#dfdfdf"
                }

                Rectangle{
                    id : data
                    width: 150
                    height: 20
                    anchors.horizontalCenter: parent.horizontalCenter
                    y : parent.y - 10


                    border.color: "#dfdfdf"
                    border.width: 1
                    radius: 10

                    Text {
                        id: txt_data
                        text: model.date
                        anchors.centerIn: parent
                    }
                }

                Image {
                    id: img_profile
                    source: model.profile_pic
                    width: 30
                    height: 30
                    anchors.top:parent.top
                    anchors.left: parent.left
                    anchors.margins: 10
                }

                Text {
                    id: txt_profile
                    text: model.name
                    y : img_profile.y
                    x : img_profile.x + img_profile.width + 5
                }

                TextArea {
                    id: txt_content
                    topPadding: 10
                    text: model.content
                    hoverEnabled: false
                    wrapMode: Text.Wrap
                    font.family: "qrc:/fonts/fonts/Lato-Black.ttf"
                    anchors.top: txt_profile.bottom
                    x : txt_profile.x
                    readOnly: true
                    background: Rectangle {
                        color: "transparent"
                        border.color: "transparent"
                    }

                    Component.onCompleted: {
                        width = parent.width - 100
                        height = txt_content.contentHeight
                    }
                }

                Text {
                    id: txt_time
                    text: model.time
                    color : "#808080"
                    anchors.left : txt_profile.right
                    anchors.verticalCenter: txt_profile.verticalCenter
                    leftPadding: 5
                }

                Row{
                    id : img_replys
                    x : txt_profile.x
                    anchors.top: txt_content.bottom
                    anchors.margins: 5
                    property string profiles: model.reply_profiles
                    width: profiles.split(',').length * 22
                    height: 20
                    spacing: 2
                    Repeater {
                        model: img_replys.profiles.split(',').length

                        delegate: Image {
                            width: 20
                            height: 20
                            source: img_replys.profiles.split(',')[index]
                        }
                    }
                }

                Text {
                    id: txt_last_reply
                    text: img_replys.profiles.split(',').length > 1 ?  img_replys.profiles.split(',').length + " replies" : ""
                    color : "#4784bd"
                    anchors.left: img_replys.right
                    anchors.verticalCenter: img_replys.verticalCenter
                    font.bold: true
                    anchors.margins: 5
                }

                Text {
                    id: txt_last_reply_time
                    text: model.last_reply_time.length > 0 ? "Last reply today at " + model.last_reply_time : ""
                    anchors.left: txt_last_reply.right
                    anchors.verticalCenter: txt_last_reply.verticalCenter
                    color : "#808080"
                    anchors.margins: 5
                }

                TextMetrics{
                    id : textMetrics
                    font: txt_content.font
                    text: txt_content.text
                }

                onWidthChanged: {
                    txt_content.width = width - 100
                    txt_content.height = txt_content.contentHeight
                    delegate_item.height = txt_content.height + 60
                }

                Component.onCompleted: {
                    delegate_item.height = txt_content.height + 60
                }
            }
        }
    }

    Rectangle{
        id : rect_down
        width: parent.width - 20
        height: 70
        z : 100
        anchors.bottom: parent.bottom
        anchors.right: parent.right
        border.color: "#aaaaaa"
        border.width: 1
        anchors.margins: 10
        radius: 5

        TextField {
            id: textInput
            anchors.top: parent.top
            width : parent.width
            height : parent.height - 20
            anchors.margins: 10
            leftPadding: 10
            wrapMode: Text.WordWrap
            placeholderText: "Message # uxui_design"
            placeholderTextColor: hovered ? "transparent" : "#aaaaaa"
            color : "black"
            background: {
            }
            onAccepted: {
                listmodel.insert(0, {name : "HHH", content : text ,profile_pic : "qrc:/profilepics/images/hhh.png",reply_profiles : "",date : "Today ⌄",time : "6:50 PM",
                                     last_reply_time : "",emojies : "",isNew : false});

                textInput.clear()
            }
        }

        Image {
            id: img_quick
            source: "qrc:/images/images/quick.png"
            width: 15
            height: 15
            anchors.bottom: parent.bottom
            x : parent.x
            anchors.margins: 5
        }
        Text {
            id: txt_oters
            text: "|  𝐁 𝐼 § </>"
            anchors.margins: 3
            color : "#dfdfdf"
            anchors.bottom: parent.bottom
            anchors.left: img_quick.right
        }
    }

}
