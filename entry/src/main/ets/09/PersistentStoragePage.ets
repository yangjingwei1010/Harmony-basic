
// 从磁盘上读，如果读不到就给111
// 将AppStorage中的token属性写入到磁盘中
PersistentStorage.persistProp('token', '111')

@Entry
@Component
struct PersistentStoragePage {
  @StorageLink('token')
  message: string = 'Hello World';

  // aboutToAppear(): void {
  //   const token = AppStorage.get<string>('token')
  //   this.message = token!
  // }

  build() {
    Row() {
      Column() {
        Text(this.message)
          .fontSize(50)
          .fontWeight(FontWeight.Bold)
        Button('登录')
          .onClick(() => {
            AppStorage.setOrCreate('token', '123456')
          })
      }
      .height('100%')
    }
    .width('100%')
  }
}