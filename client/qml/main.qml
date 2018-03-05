import QtQuick 2.10
import QtQuick.Controls 1.4
import QtQuick.Controls 2.3
import QtQuick.Layouts 1.3

ApplicationWindow {
    visible: true
    width: 640
    height: 480
    title: qsTr("Messager")

    header: ToolBar {
        id: headerBar
        RowLayout {
            anchors.left: parent.left
            anchors.right: parent.right
            ToolButton {
                text: mainStackView.depth > 1 ? "\u25C0" : "\u2630"
                font.pixelSize: Qt.application.font.pixelSize * 1.6
                onClicked: {
                    if (mainStackView.depth > 1) {
                        mainStackView.pop()
                    } else {
                        drawer.open()
                    }
                }
            }
            Label {
                text: "Status"
                elide: Label.ElideRight
                horizontalAlignment: Qt.AlignHCenter
                verticalAlignment: Qt.AlignVCenter
                Layout.fillWidth: true
            }
            ToolButton {
                text: qsTr("⋮")
            }
        }
    }

    StackView {
        id: mainStackView
        anchors.fill: parent
        initialItem: WorkspaceForm { id: workspace }
    }

    Drawer {
        id: drawer
        width: parent.width * 0.66
        height: parent.height

        Column {
            anchors.fill: parent

            ItemDelegate {
                text: qsTr("Contacts")
                width: parent.width
                onClicked: {
                    workspace.currentPageIndex = 0
                    drawer.close()
                }
            }

            ItemDelegate {
                text: qsTr("Chats")
                width: parent.width
                onClicked: {
                    workspace.currentPageIndex = 1
                    drawer.close()
                }
            }

            ItemDelegate {
                text: qsTr("Last")
                width: parent.width
                onClicked: {
                    workspace.currentPageIndex = 2
                    drawer.close()
                }
            }

            Rectangle {
                border.width: 2
                height: 4
                border.color: "black"
                width: drawer.width * 0.9
                x: drawer.width * 0.05
            }

            ItemDelegate {
                text: qsTr("Settings")
                width: parent.width
                onClicked: {
                    mainStackView.push("SettingsForm.ui.qml")
                    drawer.close()
                }
            }

        }
    }

//    footer: TabBar {
//        id: tabBar
//        currentIndex: mainSwipeView.currentIndex

//        TabButton {
//            text: qsTr("Contacts")
//        }
//        TabButton {
//            text: qsTr("Chats")
//        }
//        TabButton {
//            text: qsTr("Last")
//        }
//    }
}
