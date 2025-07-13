import { PreferenceClass } from './PreferenceStorageClass';
import { promptAction, router } from '@kit.ArkUI';

@Entry
@Component
struct PreferenceStoragePage {
  @State message: string = '暂未登录';

  build() {
    Row() {
      Column() {
        Text(this.message)
          .fontSize(50)
          .fontWeight(FontWeight.Bold)
        Button('登录')
          .onClick(() => {
            console.log('token1:' + PreferenceClass.getToken(getContext()) as string)
            PreferenceClass.setToken(getContext(),'123456')
            console.log('token2:' + PreferenceClass.getToken(getContext()) as string)
            AlertDialog.show({
              message: '登录成功'
            })
            router.pushUrl({
              url: '09/PreferenceStoragePage2'
            })
          })
      }
      .height('100%')
    }
    .width('100%')
  }
}