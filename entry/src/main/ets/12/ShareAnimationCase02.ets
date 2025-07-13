@Entry
@Component
struct ShareAnimationCase02 {
  @State message: string = 'ShareAnimationCase02';

  build() {
    Column() {
      Text(this.message)
        .fontSize(50)
        .fontWeight(FontWeight.Bold)
      Image($r('app.media.b'))
        .width(50)
        .position( {
          x: 10,
          y: 10
        })
        .sharedTransition('imageShared', {
          duration: 5000
        })
    }
    .height('100%')
    .width('100%')
  }
}