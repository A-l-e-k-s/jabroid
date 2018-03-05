import QtQuick 2.10
import QtQuick.Controls 1.4
import QtQuick.Controls 2.3

Page {
    property alias currentPageIndex: mainSwipeView.currentIndex

    SplitView {
        anchors.fill: parent
        orientation: Qt.Horizontal

        ContactsForm {
            z: 2
        }

        SwipeView {
            id: mainSwipeView
            z: 1

            ContactsForm {
                visible: mainSwipeView.currentIndex === 0
            }

            ChatsForm {
                visible: mainSwipeView.currentIndex === 1
            }

            LastChatForm {
                visible: mainSwipeView.currentIndex === 2
            }
        }
    }
}
