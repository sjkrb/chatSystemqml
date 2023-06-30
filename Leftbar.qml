import QtQuick 2.15
import QtQuick.Controls 2.15

Item {

    Rectangle{
        anchors.fill: parent
        color : "#3f0f3f"
        border{
            color : "#522752"
            width: 1
        }
    }


    ListView {
        id : leftbar_list
        width: parent.width

        model : ListModel {
            id: listModel
            ListElement { name: "A"; selected: false }
            ListElement { name: "B"; selected: false }
            ListElement { name: "C"; selected: false }
        }

        height: listModel.count * 50

        delegate: Item {

            property bool selected: listModel.get(index).selected

            width: ListView.view.width
            height: 50

            Button{
                anchors.fill: parent
                background: Rectangle{
                    anchors.fill: parent
                    color : "#616061"
                    anchors.margins: 10
                    radius: 5
                }
                onClicked: {
                    listModel.setProperty(index, "selected", true);
                    for (var i = 0; i < listModel.count; i++) {
                        if (i !== index)
                            listModel.setProperty(i, "selected", false);
                    }
                }
            }

            Loader{
                id: contentLoader
                anchors.fill: parent
                active: selected
                sourceComponent: selected_specifier_rectangle
            }

            Component{
                id : selected_specifier_rectangle
                Rectangle{
                    anchors.fill: parent
                    color : "transparent"
                    anchors.margins: 5
                    radius: 10
                    border{
                        color : "#ffffff"
                        width: 2
                    }
                }
            }

            Text {
                anchors.centerIn: parent
                text: listModel.get(index).name
                color : "#ebebeb"
                font.bold: true
            }
        }

    }

    Button{
        id : btn_append_to_list

        anchors.top : leftbar_list.bottom
        height: 50
        width: 50

        Text{
            text: "+"
            color : "#d5cad5"
            font.pointSize:  40
            anchors.centerIn: btn_append_to_list
        }

        background: Rectangle{
            color : "transparent"
        }

        onClicked: {
            listModel.append({name: "D", selected: false})
            btn_append_to_list.destroy()
        }
    }
}
