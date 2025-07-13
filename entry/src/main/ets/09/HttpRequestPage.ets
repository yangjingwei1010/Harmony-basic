import http from '@ohos.net.http';
// import { JSON } from '@kit.ArkTS';
import axios, { AxiosResponse } from '@ohos/axios'
import { promptAction } from '@kit.ArkUI';

@Entry
@Component
struct HttpRequestPage {
  @State message: string = 'Hello World';

  async sendHttp() {
    try {
      const req = http.createHttp()
      const res = await req.request("https://zhousg.atomgit.net/harmonyos-next/takeaway.json")
      AlertDialog.show({
        message: res.result as string
      })
    } catch (e) {
      promptAction.showToast({
        message: e as string
      })
    }
  }

  async sendAction() {
    const result = await axios.get<object, AxiosResponse<object,null>>("https://zhousg.atomgit.net/harmonyos-next/takeaway.json")
    return result
  }

  build() {
    Row() {
      Column() {
        Button('网络请求')
          .onClick(() => {
            this.sendHttp()
          })
        Button('网络请求')
          .onClick(async () => {
            const res = await this.sendAction()
            AlertDialog.show({
              message: JSON.stringify(res)
            })
          })
      }
      .width('100%')
    }
    .height('100%')
  }
}