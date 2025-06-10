import QtQuick 2.15
import QtQuick.Controls 2.15

import QtModelsToolkit 1.0

ApplicationWindow {
    width: 640
    height: 480
    visible: true
    title: qsTr("Hello World")

    ListModel {
        id: listModel1

        ListElement {
            name: "model 1 entry 1"
        }
        ListElement {
            name: "model 1 entry 2"
        }
        ListElement {
            name: "model 1 entry 3"
        }
    }

    ListModel {
        id: listModel2

        ListElement {
            name: "model 1 entry 1"
        }
        ListElement {
            name: "model 1 entry 2"
        }
        ListElement {
            name: "model 1 entry 3"
        }
    }

    ListView {
        anchors.fill: parent

        model: ConcatModel {
            sources: [
                SourceModel {
                    model: listModel1
                    markerRoleValue: "first_model"
                },
                SourceModel {
                    model: listModel2
                    markerRoleValue: "second_model"
                }
            ]

            markerRoleName: "which_model"
        }

        delegate: Label {
            text: name + ", " + which_model
        }
    }
}
