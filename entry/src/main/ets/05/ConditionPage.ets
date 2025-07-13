@Entry
@Component
struct ConditionPage {
  @State message: string = 'Hello World';
  @State isShow: boolean = false

  build() {
    Row() {
      Column() {
        Toggle({
          type: ToggleType.Switch,
          isOn: $$this.isShow
        })
        // if (this.isShow) {
        //   Image($r('app.media.b'))
        //     .width(100)
        // } else {
        //   Image($r('app.media.a'))
        //     .width(100)
        // }
        Image($r('app.media.b'))
          .width(100)
          .visibility(this.isShow ? Visibility.Visible : Visibility.None)
        Image($r('app.media.a'))
          .width(100)
          .visibility(this.isShow ? Visibility.None : Visibility.Visible)
      }
      .width('100%')
    }
    .height('100%')
  }
}