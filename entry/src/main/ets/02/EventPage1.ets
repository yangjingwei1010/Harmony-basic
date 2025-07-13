import { promptAction } from '@kit.ArkUI';
import { hilog } from '@kit.PerformanceAnalysisKit';

@Entry
@Component
struct EventPage1 {
  @State message: string = 'Hello World';
  login() {
    AlertDialog.show({
      message: '登录button点击'
    })
  }
  build() {
    Row() {
      Column({space: 20}) {
        TextInput()
        TextInput({
          placeholder: '请输入'
        })
          .onChange((value) => {
            promptAction.showToast({
              message: '值改变' + value
            })
            console.log('onChange' + value)
          })
          .onSubmit(() => {
            promptAction.showDialog({
              message: '提交了'
            })
          })
          .onFocus(() => {
            promptAction.showToast({
              message: '光标聚焦'
            })
          })
          .onBlur(() => {
            promptAction.showToast({
              message: '失去焦点'
            })
          })
        Row() {
          Button('登录')
            .layoutWeight(1)
        }
        .onClick(() => {
          this.login()
        })

      }
      .padding(24)
      .width('100%')
    }
    .height('100%')
  }
}