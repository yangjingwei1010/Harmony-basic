import { request } from '@kit.BasicServicesKit';
import File from '@system.file';

@Entry
@Component
struct DownloadCase {
  @State message: string = 'Hello World';
  @State downloadUrl: string = 'https://foruda.gitee.com/avatar/1705232317138324256/1759638_itcast_panpu_1705232317.png'
  @State filePath: string = ''


  build() {
    Column({space: 20}) {
      Image(this.downloadUrl)
        .width(200)
        .aspectRatio(1)
      Button('下载')
        .onClick(async () => {
          let filePath: string = getContext().cacheDir + '/test1.jpg'
          const tast = await request.downloadFile(getContext(), {
            url: this.downloadUrl,
            filePath: filePath
          })
          tast.on('complete', () => {
            AlertDialog.show({
              message: '下载成功'
            })
            this.filePath = filePath
          })
        })
      if (this.filePath !== '') {
        Image('file://' + this.filePath)
          .width(200)
          .aspectRatio(1)
      }
    }
    .justifyContent(FlexAlign.Start)
    .height('100%')
    .width('100%')
  }
}