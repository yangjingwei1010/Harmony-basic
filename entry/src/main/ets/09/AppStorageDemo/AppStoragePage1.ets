import { promptAction, router } from '@kit.ArkUI'
import { JSON } from '@kit.ArkTS'

@Entry
@Component
struct AppStoragePage1 {
  @State
  username: string = ""
  @State
  password: string = ""
  @State user: Record<string, string> = {
    'username': 'zs',
    'password': ''
  }
  aboutToAppear(): void {
    const user = AppStorage.get<Record<string, string>>('userInfo')
    this.user = user!
  }

  login() {
    if (this.username === 'admin' && this.password === '123456') {
      const userInfo: Record<string, string> = {
        'nickName': 'yang',
        'age': '14'
      }
      AppStorage.setOrCreate<Record<string, string>>('userInfo', userInfo)
      // 跳转
      router.pushUrl({
        url: '09/AppStorageDemo/AppStoragePage2'
      })
    } else  {
      promptAction.showToast({
        message: '账号密码错误'
      })
    }
  }
  build() {
    Row() {
      Column({ space: 20 }) {
        Text(JSON.stringify(this.user))
        TextInput({ placeholder: '请输入用户名', text: $$this.username })
        TextInput({ placeholder: '请输入密码', text: $$this.password })
          .type(InputType.Password)
        Button("登录")
          .width('100%')
          .onClick(() => {
            this.login()

          })
      }
      .padding(20)
      .width('100%')
    }
    .height('100%')
  }
}