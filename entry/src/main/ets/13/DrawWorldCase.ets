import { fileIo } from '@kit.CoreFileKit'
import { buffer } from '@kit.ArkTS'

@Entry
@Component
struct DrawWorldCase {
  myPen: CanvasRenderingContext2D = new CanvasRenderingContext2D(new RenderingContextSettings(true))
  @State
  imageUrl: string = ''
  build() {
    Column() {
      Canvas(this.myPen)
        .width('100%')
        .height(350)
        .backgroundColor(Color.Pink)
        .onReady(() => {
          this.myPen.lineWidth = 4
          this.myPen.strokeStyle = 'red'
        })
        .onTouch((event: TouchEvent) => {
          if (event.type === TouchType.Down) {
            this.myPen.beginPath()
            this.myPen.moveTo(event.touches[0].x, event.touches[0].y)
          } else if (event.type === TouchType.Move) {
            this.myPen.lineTo(event.touches[0].x, event.touches[0].y)
            this.myPen.stroke()
          } else if (event.type === TouchType.Up) {
            this.myPen.closePath()
          }
      })
      Button('保存')
        .onClick(() => {
          this.imageUrl = this.myPen.toDataURL('image/jpg')
          // 保存到沙箱
          let img = this.myPen.toDataURL('image/jpg')
          const filePath = getContext().tempDir + '/' + Date.now() + '.jpg'
          const file = fileIo.openSync(filePath, fileIo.OpenMode.CREATE|fileIo.OpenMode.READ_WRITE)
          const base64Image = img.split(';base64,').pop()
          const imageBuffer = buffer.from(base64Image, 'base64')
          fileIo.write(file.fd, imageBuffer.buffer)
          fileIo.close(file)
          this.imageUrl = 'file://' + filePath
        })
      if (this.imageUrl) {
        Image(this.imageUrl)
          .width('100%')
      }
    }
    .height('100%')
    .width('100%')
  }
}