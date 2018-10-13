import QtQuick 2.0
import QtQuick.Controls 2.3

Item {
    property string name: "ProgressTimer"
    property int startValue
    property alias value: progressBar.value
    property alias interval: timer.interval
    property alias to: progressBar.to


    signal timerStop()

    anchors.right: parent.right
    anchors.left: parent.left
    height: progressBar.height

    Column{
        id: column
        anchors.fill: parent

        ProgressBar {
            id: progressBar
            anchors.right: parent.right
            anchors.left: parent.left

        }

        Timer {
            id: timer
            interval: 1000
            running: true
            repeat: true
            onTriggered: {
                progressBar.value = progressBar.value - 1;
                if (progressBar.value <= 0) {
                    stopTimer()
                }
            }
        }
    }

    function startTimer() {
        progressBar.value = startValue
        timer.start()
    }

    function restartTimer() {
        progressBar.value = startValue
        timer.restart()
    }

    function stopTimer() {
        timer.stop();
        timerStop();
    }

    function pauseTimer() {
        timer.stop();
    }

}
