

@Entry
@Component
struct AppStoragePage2 {
  // 第一种写法
  // @State
  // userInfo: Record<string, string> = {
  //   'nickName': 'ff',
  //   'age': '11'
  // }

  // 第二种写法
  @StorageProp('userInfo')
  userInfo: Record<string, string> = {
    'nickName': 'ff',
    'age': '11'
  }

  aboutToAppear(): void {
    // 第一种写法
    // this.userInfo = AppStorage.get<Record<string, string>>('userInfo')!

  }

  build() {
    Column() {
      Row({ space: 20 }) {
        Image($r('app.media.b'))
          .width(60)
          .aspectRatio(1)
          .borderRadius(30)
        Column({ space: 10 }) {
          Text(`姓名：${this.userInfo.nickName}`)
          Text(`年龄：${this.userInfo.age}`)
        }
      }
      .alignItems(VerticalAlign.Center)
      .padding(20)
      .width('100%')

      Button("退出")
    }
    .width('100%')
    .height('100%')
  }
}