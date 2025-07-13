import { geoLocationManager } from '@kit.LocationKit'
import { promptAction } from '@kit.ArkUI'
import { JSON } from '@kit.ArkTS'

@Entry
@Component
struct PermissionQuestPage {
  @State result: geoLocationManager.Location = {} as geoLocationManager.Location

  build() {
    Row() {
      Column() {
        Button('获取经纬度')
          .onClick(async  () => {
            this.result = await geoLocationManager.getCurrentLocation()

          })
        Text('经度：' + this.result.latitude)
        Text('纬度：' + this.result.longitude)
      }
      .width('100%')
    }
    .height('100%')
  }
}