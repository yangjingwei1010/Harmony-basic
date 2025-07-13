import { promptAction } from '@kit.ArkUI';
import { JSON } from '@kit.ArkTS';

@Entry
@Component
struct Click1Page {

  @State userName: string = ''
  password: string = ''

  loginSuccess() {
    this.userName = 'admin1edewfs'
    promptAction.showToast({
      message: '登录成功'
    })
  }

  loginFail() {
    promptAction.showToast({
      message: '登录失败'
    })
  }

  build() {
    Row() {
      Column({space: 20}) {
        Image('https://www.baidu.com/img/PCtm_d9c8750bed0b3c7d089fa7d55720d6cf.png')
          .width(160)
          // .onAreaChange((oldValue: Area, newValue: Area) => {
            // AlertDialog.show({
            //   message: `oldValue: ${JSON.stringify(oldValue)}
            //   newValue: ${JSON.stringify(newValue)}`
            // })
          // })
        TextInput({
          placeholder: '输入用户名',
          text: this.userName
        })
          .height(40)
          .onChange((value) => {
            this.userName = value
            promptAction.showToast({
              message: this.userName
            })
          })
        TextInput({
          placeholder: '输入密码',
          text: this.password
        })
          .type(InputType.Password)
          .height(40)
          .onChange((value) => {
            this.password = value
            promptAction.showToast({
              message: this.password
            })
          })
        Button('登录')
          .width('100%')
          .onClick(() => {
            if (this.userName === 'admin' && this.password ==='123456') {
              this.loginSuccess()
            } else {
              this.loginFail()
            }
          })
      }
      .padding({left: 20, right: 20})
      .width('100%')
    }
    .height('100%')
  }
}