@Entry
@Component
struct StateStylePage {
  @State message: string = 'Hello World';

  build() {
    Row() {
      Column({space: 20}) {
        TextInput({placeholder: '请输入'})
          .width('100%')
          .border({
            width: 0
          })
          .stateStyles({
            normal: {
              .border({
                width: 0
              })
            },
            focused: {
              .border({
                width: 2,
                color: '#007dfe'
              })
            }
          })
        Button('注册')
          .width('100%')
          .backgroundColor(Color.Green)
          .stateStyles({
            pressed: {
              .backgroundColor(Color.Blue)
            }
          })
      }
      .width('100%')
    }
    .height('100%')
  }
}