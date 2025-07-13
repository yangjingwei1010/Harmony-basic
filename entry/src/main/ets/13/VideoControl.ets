@Entry
@Component
struct VideoControl {
  @State message: string = 'Hello World';
  @State
  speed: number = 1
  @State
  mute: boolean = false
  @State
  isFullScreen: boolean = false
  controller: VideoController = new VideoController()
  @State
  time: number = 0
  @State
  duration: number = 0

  build() {
    Column({space: 20}) {
      Stack({alignContent: Alignment.BottomEnd}) {
        Video({
          src: $rawfile('1.mp4'),
          // 封面
          previewUri: $r('app.media.b'),
          // 倍速
          currentProgressRate: this.speed,
          controller: this.controller
        })
          .height(500)
          .objectFit(ImageFit.Contain)
            // 不展示控制条
          .controls(this.isFullScreen)
            // 自动播放
          .autoPlay(false)
            // 循环播放
          .loop(true)
            // 静音
          .muted(this.mute)
          .onPrepared((duration) => {
            this.duration = duration.duration
          })
          .onUpdate((value) => {
            this.time = value.time
          })
          .onFullscreenChange((screen) => {
            this.isFullScreen = screen.fullscreen
          })

        Button('全屏')
          .onClick(() => {
            this.controller.requestFullscreen(true)
            this.isFullScreen = true
          })
      }
      Row() {
        Text('播放进度：')
        Slider({
          value: this.time,
          max: this.duration,
          min: 0,
          style: SliderStyle.InSet
        })
          .onChange((val) => {
            this.controller.setCurrentTime(val)
            this.time = val
          })
      }
      Row() {
        Text('播放速度：')
        Slider({
          value: this.speed,
          min: 0.75,
          max: 2,
          step: 0.25,
          style: SliderStyle.InSet
        })
          .onChange((val) => {
            this.speed = val
          })
      }
      Row({space: 10}) {
        Button('播放')
          .onClick(() => {
            this.controller.start()
          })
        Button('暂停')
          .onClick(() => {
            this.controller.pause()
          })
        Button('停止')
          .onClick(() => {
            this.controller.stop()
          })
        Button('静音')
          .onClick(() => {
            this.mute != this.mute
          })
      }
    }
    .height('100%')
    .width('100%')
  }
}