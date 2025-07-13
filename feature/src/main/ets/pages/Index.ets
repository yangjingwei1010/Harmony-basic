import { common } from '@kit.AbilityKit';

@Entry
@Component
struct Index {
  @State message: string = 'HAP-index';
  @StorageProp('orderId')
  orderId: number = 0

  build() {
    RelativeContainer() {
      Text(this.message + ':' + this.orderId)
        .id('HelloWorld')
        .fontSize(50)
        .fontWeight(FontWeight.Bold)
        .alignRules({
          center: { anchor: '__container__', align: VerticalAlign.Center },
          middle: { anchor: '__container__', align: HorizontalAlign.Center }
        })
      Button('支付')
        .onClick(() => {
          (getContext() as common.UIAbilityContext).terminateSelfWithResult({
            resultCode: 200,
            want: {
              deviceId: '',
              moduleName: 'entry',
              abilityName: 'EntryAbility',
              bundleName: 'com.example.firsttest',
              parameters: {
                parResult: true
              }
            }
          })
        })
    }
    .height('100%')
    .width('100%')
  }
}