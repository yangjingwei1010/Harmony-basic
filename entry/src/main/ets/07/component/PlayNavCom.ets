

@Component
struct PlayNavCom {
  @Consume
  isPlay: boolean
  build() {
    Row({space: 20}) {
      Image($r('app.media.b'))
        .width(30)
        .aspectRatio(1)

      Text('耍猴的 二手月季')
        .layoutWeight(1)
        .padding(20)

      Image(this.isPlay ? $r('sys.media.ohos_ic_public_pause') : $r('sys.media.ohos_ic_public_play'))
        .width(20)
        .aspectRatio(1)
        .onClick(() => {
          this.isPlay = !this.isPlay
        })
    }
    .width('100%')
    .padding(20)
    .backgroundColor(Color.Pink)
  }
}

export {PlayNavCom}