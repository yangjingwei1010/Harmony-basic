import { request, zlib } from '@kit.BasicServicesKit';
import { promptAction, router } from '@kit.ArkUI';

@Entry
@Component
struct WebviewCase01 {
  @State message: string = 'Hello World';
  @State
  downloadUrl: string = 'https://gitee.com/shuiruohanyu/toutiao_net/raw/master/resources/toutiao.zip'
  @State
  showProgress: boolean = false
  @State
  current: number = 0
  @State
  total: number = 0

  filePath = ''

  async downloadZip() {
    this.showProgress = true
    const fileName = 'toutiao3.zip'
    let filePath = getContext().filesDir + fileName
    const tast = await request.downloadFile(getContext(),{
      url: this.downloadUrl,
      filePath: filePath
    })
    tast.on('progress', (current, total) => {
      this.current = current
      this.total = total
    })
    tast.on('complete', () => {
      this.showProgress = false
      this.filePath = filePath
      this.decompressFile()
    })
    tast.on('fail', () => {
      promptAction.showToast({
        message: '下载失败'
      })
    })
  }

  // 解压文件
  async  decompressFile() {
    try {
      await zlib.decompressFile(this.filePath, getContext().filesDir)
      router.pushUrl({
        url: '13/WebviewCase02'
      })
    } catch (err) {
      promptAction.showToast({
        message: '解压失败'
      })
    }
  }

  build() {
    Column({space: 20}) {
      Divider()
        .height(50)
      Button('热更新')
        .onClick(() => {
          this.downloadZip()
        })

      if (this.showProgress) {
        Progress({
          value: this.current,
          total: this.total
        })
          .width('100%')
      }
    }
    .justifyContent(FlexAlign.Start)
    .height('100%')
    .width('100%')
  }
}