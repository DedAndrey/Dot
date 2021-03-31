import QtQuick 2.5


Rectangle {
    id: root
    color: "#000000"

     property int stage

    onStageChanged: {
        if (stage == 1) {
            introAnimation.running = true
        }
    }

    Item {
        id: content
        anchors.fill: parent
        opacity: 0
        TextMetrics {
            id: units
            text: "M"
            property int gridUnit: boundingRect.height
            property int largeSpacing: units.gridUnit
            property int smallSpacing: Math.max(2, gridUnit/4)
        }


      AnimatedSprite {
         anchors.centerIn: parent
         source: "images/manjaro-sprite.png"
         frameWidth: 150
         frameHeight: 150
         frameCount: 48
        frameDuration: 100
        interpolate: true
      }

    }

    OpacityAnimator {
        id: introAnimation
        running: false
        target: content
        from: 0
        to: 1
        duration: 1000
        easing.type: Easing.InOutQuad
    }
}
