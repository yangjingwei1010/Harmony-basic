@Entry
@Component
struct ImageFrameCase {
  @State message: string = 'Hello World';
  @State playState: AnimationStatus = AnimationStatus.Initial

  build() {
    Column({space: 20}) {
      Text(this.message)
        .fontSize(50)
        .fontWeight(FontWeight.Bold)
        ImageAnimator()
          // .images([
          //   {src: '/assets/JDRunMan/app_refresh_people_0.png'},
          //   {src: '/assets/JDRunMan/app_refresh_people_1.png'},
          //   {src: '/assets/JDRunMan/app_refresh_people_2.png'},
          //   {src: '/assets/JDRunMan/app_refresh_people_3.png'}
          // ])
          .images(Array.from(Array(37), (item: string, index: number) => {
            return { src: `/assets/JDLoading/loading_${index + 1}.png`} as ImageFrameInfo
          }))
          .width(340)
          .height(340)
          .duration(3000)
          .iterations(-1)
          .fillMode(FillMode.None)
          .state(this.playState)
      Button('播放')
        .onClick(() => {
          this.playState = AnimationStatus.Running
        })

      Button('暂停')
        .onClick(() => {
          this.playState = AnimationStatus.Paused
        })
    }
    .height('100%')
    .width('100%')
  }
}